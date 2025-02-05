//
//  ContentView.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MessagesListView()
                    .tabItem {
                        Image(systemName: "message")
                        Text("Messages")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// End of file. No additional code.

// End of file. No additional code.
