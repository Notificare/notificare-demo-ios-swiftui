//
//  InboxItem.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import Foundation

struct InboxItem: Decodable {
    let id: String
    let title: String
    let message: String
    let attachment: String?
    let receivedAt: String
    let read: Bool
}
