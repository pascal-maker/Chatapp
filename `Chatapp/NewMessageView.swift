//
//  NewMessageView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    let onSelectUser: (String) -> Void
    
    // Sample users - replace with actual user data
    let users = ["John Doe", "Jane Smith", "Mike Johnson", "Sarah Williams"]
    
    var body: some View {
        NavigationView {
            List(filteredUsers, id: \.self) { user in
                Button(action: {
                    onSelectUser(user)
                }) {
                    Text(user)
                }
            }
            .searchable(text: $searchText, prompt: "Search users")
            .navigationTitle("New Message")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private var filteredUsers: [String] {
        if searchText.isEmpty {
            return users
        }
        return users.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
}

// End of file. No additional code.
