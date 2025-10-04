//
//  PictureFrameView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/3/25.
//

import SwiftUI
import Combine

struct PictureFrameView: View {
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Placeholder for photo - will add photo picker later
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            // Clock overlay in lower third
            VStack {
                Spacer()
                
                // Glass morphism effect clock
                Text(timeString)
                    .font(.system(size: 80, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .shadow(radius: 10)
                    )
                    .padding(.bottom, 60)
            }
        }
        .onReceive(timer) { input in
            currentTime = input
        }
    }
    
    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: currentTime)
    }
}

#Preview {
    PictureFrameView()
}
