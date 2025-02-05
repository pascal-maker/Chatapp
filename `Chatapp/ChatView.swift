//
//  ContentView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

// End of file. No additional code.
import SwiftUI
import AVKit

struct ChatView: View {
    @State private var messages: [Message] = []
    @State private var newMessage = ""
    @State private var isShowingMediaPicker = false
    @State private var isRecording = false
    @State private var isShowingCallView = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            
            HStack {
                Button(action: { isShowingMediaPicker = true }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                }
                .padding(.leading)
                
                Button(action: toggleRecording) {
                    Image(systemName: isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(isRecording ? .red : .primary)
                }
                
                TextField("Message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 24))
                }
                .disabled(newMessage.isEmpty)
                
                Button(action: { isShowingCallView = true }) {
                    Image(systemName: "phone.circle.fill")
                        .font(.system(size: 24))
                }
                .padding(.trailing)
            }
            .padding(.vertical, 8)
            .background(Color(.systemBackground))
        }
        .sheet(isPresented: $isShowingMediaPicker) {
            MediaPicker { url in
                handleMediaSelection(url)
            }
        }
        .sheet(isPresented: $isShowingCallView) {
            CallView()
        }
    }
    
    private func sendMessage() {
        let message = Message(type: .text(newMessage), isFromCurrentUser: true)
        messages.append(message)
        newMessage = ""
    }
    
    private func toggleRecording() {
        isRecording.toggle()
        // Implement audio recording logic
    }
    
    private func handleMediaSelection(_ url: URL) {
        // Determine media type and create appropriate message
        let message = Message(type: .image(url), isFromCurrentUser: true)
        messages.append(message)
    }
}

// End of file. No additional code.
