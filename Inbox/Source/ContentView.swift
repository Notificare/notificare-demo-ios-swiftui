//
//  ContentView.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inboxItems: [NotificareDeviceInbox] = []
    @State private var unreadCount = 0
    @State private var inboxLoaded = false
    
    init() {
        // Remove default separators
        UITableView.appearance(whenContainedInInstancesOf: [UIHostingController<ContentView>.self]).separatorColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                if inboxLoaded && inboxItems.isEmpty {
                    Text("You have no notifications")
                        .font(.headline)
                } else {
                    List {
                        if unreadCount > 0 {
                            Text("You have \(unreadCount) unread notifications")
                                .font(.subheadline)
                                .padding(.bottom)
                        }
                        
                        ForEach (inboxItems, id: \.inboxId) { inboxItem in
                            InboxItemView(inboxItem: inboxItem)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
            .navigationBarTitle("Inbox")
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name.UpdateInbox), perform: { _ in
            self.updateInbox()
        })
    }
    
    private func updateInbox() {
        NotificarePushLib.shared().inboxManager.fetchInbox { (response, error) in
            guard let items = response as? [NotificareDeviceInbox] else { return }
            
            self.inboxItems = items
            self.unreadCount = items.filter { !$0.opened }.count
            self.inboxLoaded = true
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
