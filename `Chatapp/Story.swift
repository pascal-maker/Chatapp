//
//  Story.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import Foundation

struct Story: Identifiable {
    let id = UUID()
    let imageURL: URL
    let createdAt: Date
    let userId: UUID
    
    var isExpired: Bool {
        let calendar = Calendar.current
        let now = Date()
        let expirationDate = calendar.date(byAdding: .hour, value: 24, to: createdAt) ?? now
        return now > expirationDate
    }
}

// End of file. No additional code.
