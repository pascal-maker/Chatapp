//
//  StoriesSection.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct StoriesSection: View {
    let stories: [Story]
    let addStory: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stories")
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    AddStoryButton(action: addStory)
                    
                    ForEach(stories) { story in
                        StoryThumbnail(story: story)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct AddStoryButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                }
                
                Text("Add Story")
                    .font(.caption)
            }
        }
    }
}

struct StoryThumbnail: View {
    let story: Story
    
    var body: some View {
        VStack {
            AsyncImage(url: story.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
            )
            
            Text(story.createdAt, style: .time)
                .font(.caption)
        }
    }
}

// End of file. No additional code.
