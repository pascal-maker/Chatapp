//
//  ProfileDetails.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct ProfileDetails: View {
    @Binding var profile: UserProfile
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailRow(title: "Bio", isEditing: isEditing, text: $profile.bio)
            DetailRow(title: "Phone", isEditing: isEditing, text: $profile.phoneNumber)
            DetailRow(title: "Status", isEditing: isEditing, text: $profile.status)
        }
    }
}

struct DetailRow: View {
    let title: String
    let isEditing: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            if isEditing {
                TextField(title, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(text)
            }
            
            Divider()
        }
    }
}

// End of file. No additional code.
