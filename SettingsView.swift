//
//  SettingsView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/3/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Text("Settings coming soon")
                    .foregroundColor(.white)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}
