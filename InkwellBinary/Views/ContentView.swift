//
//  ContentView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettings = false
    
    var body: some View {
        ZStack {
            // Swipeable clock faces
            TabView {
                BedsideDayView()
                BedsideNightView()
                DashboardView()
                PictureFrameView()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // Settings gear overlay
            VStack {
                HStack {
                    Spacer()
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white.opacity(0.6))
                            .padding()
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(isPresented: $showSettings)
        }
    }
}

#Preview {
    ContentView()
}
