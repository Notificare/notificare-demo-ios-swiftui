//
//  SampleData.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import Foundation

fileprivate let dateFormat = ISO8601DateFormatter()
fileprivate let data: [InboxItem] = loadData("sample-data.json")

let inboxItems = data.sorted {
    let date1 = dateFormat.date(from: $0.receivedAt)!
    let date2 = dateFormat.date(from: $1.receivedAt)!
    
    return date1.compare(date2) == .orderedDescending
}


fileprivate func loadData<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
