//
//  DashboardView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/3/25.
//

import SwiftUI
import Combine

struct DashboardView: View {
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Main time display
                    Text(timeString)
                        .font(.system(size: 1000, weight: .thin, design: .monospaced))
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width * 0.9)
                    
                    // Date display
                    Text(dateString)
                        .font(.system(size: 30, weight: .light, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                }
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
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: currentTime)
    }
}

#Preview {
    DashboardView()
}
