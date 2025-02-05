//
//  ImagePicker.swift
//  `Chatapp
//
//  Created by Pascal Musabyimana on 05/02/2025.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    let completion: (URL) -> Void
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationView {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("Select Photo")
            }
            .onChange(of: selectedItem) { item in
                Task {
                    if let data = try? await item?.loadTransferable(type: Data.self) {
                        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(UUID().uuidString)
                        try? data.write(to: tempURL)
                        completion(tempURL)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Choose Photo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// End of file. No additional code.
