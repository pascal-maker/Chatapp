//
//  AudioPlayerView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    let url: URL
    @State private var player: AVPlayer?
    @State private var isPlaying = false
    
    var body: some View {
        HStack {
            Button(action: togglePlayback) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 24))
            }
            
            Image(systemName: "waveform")
                .font(.system(size: 24))
        }
        .onAppear {
            player = AVPlayer(url: url)
        }
        .onDisappear {
            player?.pause()
            player = nil
        }
    }
    
    private func togglePlayback() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }
}

// End of file. No additional code.
