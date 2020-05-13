//
//  InboxItemView.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import SwiftUI

struct InboxItemView: View {
    @Environment(\.imageCache) var cache: ImageCache
    @State var inboxItem: InboxItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if inboxItem.attachment != nil {
                AsyncImage(
                    url: URL(string: inboxItem.attachment!)!,
                    cache: self.cache,
                    placeholder: attachmentPlaceholder,
                    errorPlaceholder: attachmentErrorPlaceholder,
                    content: {
                        $0.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(self.inboxItem.color, lineWidth: 2))
                }
                )
            } else {
                itemIndicator
            }
            
            VStack(alignment: .leading) {
                Text(inboxItem.title)
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text(inboxItem.message)
                    .font(.body)
                    .opacity(0.54)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack {
                Text(Date(fromIso8601String: inboxItem.receivedAt)!.timeAgo)
                    .font(.caption)
                    .opacity(0.54)
                
                if !inboxItem.read {
                    Text("")
                        .frame(width: 8, height: 8)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.top)
                }
            }
        }
        .padding()
    }
    
    private var itemIndicator: some View {
        inboxItem.color
            .frame(width: 4, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var attachmentPlaceholder: some View {
        Color.black
            .opacity(0)
            .frame(width: 80, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(self.inboxItem.color, lineWidth: 2))
    }
    
    private var attachmentErrorPlaceholder: some View {
        Image(systemName: "xmark.icloud.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: 80, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(self.inboxItem.color, lineWidth: 2))
    }
}

struct InboxItemView_Previews: PreviewProvider {
    static var previews: some View {
        InboxItemView(inboxItem: inboxItems[0])
    }
}
