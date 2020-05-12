//
//  AsyncImage.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View, ErrorPlaceholder: View, Content: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let errorPlaceholder: ErrorPlaceholder?
    private let content: (Image) -> Content
    
    init(url: URL, cache: ImageCache? = nil, placeholder: Placeholder? = nil, errorPlaceholder: ErrorPlaceholder? = nil, @ViewBuilder content: @escaping (Image) -> Content) {
        self.loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
        self.errorPlaceholder = errorPlaceholder
        self.content = content
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                content(Image(uiImage: loader.image!))
            } else if loader.isLoading {
                placeholder
            } else {
                errorPlaceholder
            }
        }
    }
}
