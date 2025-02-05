//
//  ChatPreview.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import Foundation

struct ChatPreview: Identifiable {
    let id = UUID()
    let contactName: String
    let lastMessage: String
    let timestamp: Date
    let unreadCount: Int
    let profileImage: URL?
}

// End of file. No additional code.
