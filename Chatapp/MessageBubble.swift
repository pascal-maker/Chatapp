//
//  MessageBubble.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI
import AVKit

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
            }
            
            contentView
                .padding(12)
                .background(message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.3))
                .foregroundColor(message.isFromCurrentUser ? .white : .primary)
                .cornerRadius(16)
            
            if !message.isFromCurrentUser {
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch message.type {
        case .text(let content):
            Text(content)
        case .image(let url):
            AsyncImage(url: url) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200)
            } placeholder: {
                ProgressView()
            }
        case .audio(let url):
            AudioPlayerView(url: url)
        case .video(let url):
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: 200)
        }
    }
}

// End of file. No additional code.
// End of file. No additional code.
