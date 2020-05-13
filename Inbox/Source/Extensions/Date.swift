//
//  String.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import Foundation

extension Date {
    
    init?(fromIso8601String str: String) {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        guard let date = formatter.date(from: str) else { return nil }
        self = date
    }
}

extension Date {
    
    var timeAgo: String {
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        if let year = components.year, year >= 1 {
            return "\(year)Y"
        }
        
        if let month = components.month, month >= 1 {
            return "\(month)M"
        }

        if let week = components.weekOfYear, week >= 1 {
            return "\(week)W"
        }
        
        if let day = components.day, day >= 1 {
            return "\(day)D"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour) hr"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute) min"
        }
        
        if let second = components.second, second >= 3 {
            return "\(second) sec"
        }
        
        return "NOW"
    }
}
