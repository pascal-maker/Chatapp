//
//  UserProfile.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import Foundation

struct UserProfile: Identifiable {
    let id = UUID()
    var name: String
    var bio: String
    var profileImage: URL?
    var phoneNumber: String
    var status: String
}

// End of file. No additional code.
