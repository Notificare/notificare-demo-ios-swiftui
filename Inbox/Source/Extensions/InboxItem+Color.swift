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
        var hash = 0
        let colorConstant = 131
        let maxSafeValue = Int.max / colorConstant
        
        for char in self.message.unicodeScalars {
            if hash > maxSafeValue {
                hash = hash / colorConstant
            }
            
            hash = Int(char.value) + ((hash << 5) - hash)
        }
        
        let finalHash = abs(hash) % (256 * 256 * 256);
        let r = Double((finalHash & 0xFF0000) >> 16) / 255.0
        let g = Double((finalHash & 0xFF00) >> 8) / 255.0
        let b = Double((finalHash & 0xFF)) / 255.0
        
        return Color(red: r, green: g, blue: b)
    }
}
