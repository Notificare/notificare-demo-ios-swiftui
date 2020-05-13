//
//  InboxItem+Color.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import SwiftUI

extension InboxItem {
    
    var color: Color {
        let r = Int.random(in: 0...255)
        let g = Int.random(in: 0...255)
        let b = Int.random(in: 0...255)
        
        return Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}


extension NotificareDeviceInbox {
    
    var color: Color {
        let r = Int.random(in: 0...255)
        let g = Int.random(in: 0...255)
        let b = Int.random(in: 0...255)
        
        return Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
