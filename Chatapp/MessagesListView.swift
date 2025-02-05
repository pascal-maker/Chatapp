//
//  MessagesListView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct MessagesListView: View {
    @State private var searchText = ""
    @State private var chats: [ChatPreview] = []
    @State private var showNewMessage = false
    
    var body: some View {
        List(filteredChats) { chat in
            NavigationLink(destination: ChatView()) {
                ChatRow(chat: chat)
            }
        }
        .listStyle(PlainListStyle())
        .searchable(text: $searchText, prompt: "Search messages")
        .navigationTitle("Messages")
        .toolbar {
            Button(action: { showNewMessage = true }) {
                Image(systemName: "square.and.pencil")
            }
        }
        .sheet(isPresented: $showNewMessage) {
            NewMessageView { selectedUser in
                // Handle new chat creation
                showNewMessage = false
            }
        }
        .onAppear {
            // Load sample data
            loadSampleChats()
        }
    }
    
    private var filteredChats: [ChatPreview] {
        if searchText.isEmpty {
            return chats
        }
        return chats.filter { $0.contactName.localizedCaseInsensitiveContains(searchText) }
    }
    
    private func loadSampleChats() {
        chats = [
            ChatPreview(contactName: "John Doe", lastMessage: "Hey, how are you?", timestamp: Date(), unreadCount: 2, profileImage: nil),
            ChatPreview(contactName: "Jane Smith", lastMessage: "See you tomorrow!", timestamp: Date(), unreadCount: 0, profileImage: nil)
        ]
    }
}

// End of file. No additional code.
