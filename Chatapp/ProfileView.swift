//
//  ProfileView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var profile = UserProfile(name: "User", bio: "Hi there!", phoneNumber: "+1234567890", status: "Available")
    @State private var stories: [Story] = []
    @State private var isEditingProfile = false
    @State private var isAddingStory = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Header
                ProfileHeader(profile: $profile, isEditing: $isEditingProfile)
                
                // Stories Section
                StoriesSection(stories: stories) {
                    isAddingStory = true
                }
                
                Divider()
                
                // Profile Details
                ProfileDetails(profile: $profile, isEditing: $isEditingProfile)
            }
            .padding()
        }
        .sheet(isPresented: $isAddingStory) {
            StoryPicker { url in
                addNewStory(with: url)
            }
        }
        .navigationTitle("Profile")
        .toolbar {
            Button(isEditingProfile ? "Done" : "Edit") {
                isEditingProfile.toggle()
            }
        }
    }
    
    private func addNewStory(with url: URL) {
        let story = Story(imageURL: url, createdAt: Date(), userId: profile.id)
        stories.append(story)
        
        // Clean up expired stories
        stories = stories.filter { !$0.isExpired }
    }
}

// End of file. No additional code.
