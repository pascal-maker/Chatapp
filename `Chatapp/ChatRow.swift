//
//  ChatRow.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct ChatRow: View {
    let chat: ChatPreview
    
    var body: some View {
        HStack(spacing: 12) {
            if let imageURL = chat.profileImage {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.contactName)
                        .font(.headline)
                    Spacer()
                    Text(chat.timestamp, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text(chat.lastMessage)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if chat.unreadCount > 0 {
                        Text("\(chat.unreadCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}

// End of file. No additional code.
