//
//  ContentView.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let unreadCount = inboxItems.filter { !$0.read }.count
    
    init() {
        // Remove default separators
        UITableView.appearance(whenContainedInInstancesOf: [UIHostingController<ContentView>.self]).separatorColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    if unreadCount > 0 {
                        Text("You have \(unreadCount) unread notifications")
                        .font(.subheadline)
                        .padding(.bottom)
                    }
                    
                    ForEach (inboxItems, id: \.id) { inboxItem in
                        InboxItemView(inboxItem: inboxItem)
                            .listRowInsets(EdgeInsets())
                    }
                }
            }
            .navigationBarTitle("Inbox")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
