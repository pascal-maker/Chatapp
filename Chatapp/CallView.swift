//
//  CallView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct CallView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isAudioOnly = false
    @State private var isMuted = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.circle.fill")
                .font(.system(size: 100))
                .padding()
            
            Text("User Name")
                .font(.title)
            
            Text(isAudioOnly ? "Audio Call" : "Video Call")
                .foregroundColor(.gray)
            
            Spacer()
            
            HStack(spacing: 40) {
                Button(action: { isMuted.toggle() }) {
                    Image(systemName: isMuted ? "mic.slash.circle.fill" : "mic.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(isMuted ? .red : .blue)
                }
                
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "phone.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                }
                
                Button(action: { isAudioOnly.toggle() }) {
                    Image(systemName: isAudioOnly ? "video.slash.circle.fill" : "video.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(isAudioOnly ? .red : .blue)
                }
            }
            .padding(.bottom, 50)
        }
    }
}

// End of file. No additional code.
