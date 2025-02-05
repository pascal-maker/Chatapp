//
//  Message.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import Foundation

enum MessageType {
    case text(String)
    case image(URL)
    case audio(URL)
    case video(URL)
}

struct Message: Identifiable {
    let id = UUID()
    let type: MessageType
    let isFromCurrentUser: Bool
    let timestamp: Date
    
    // Initialize with default timestamp as current date
    init(type: MessageType, isFromCurrentUser: Bool) {
        self.type = type
        self.isFromCurrentUser = isFromCurrentUser
        self.timestamp = Date()
    }
}

// End of file. No additional code.
