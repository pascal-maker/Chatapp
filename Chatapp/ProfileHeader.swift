//
//  ProfileHeader.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct ProfileHeader: View {
    @Binding var profile: UserProfile
    @Binding var isEditing: Bool
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            if let imageURL = profile.profileImage {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            }
            
            if isEditing {
                Button("Change Photo") {
                    showImagePicker = true
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker { url in
                        profile.profileImage = url
                    }
                }
            }
            
            if isEditing {
                TextField("Name", text: $profile.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(profile.name)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

// End of file. No additional code.
