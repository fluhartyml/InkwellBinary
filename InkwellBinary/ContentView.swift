//
//  ContentView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/2/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var currentTime = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Text(timeString)
                    .font(.system(size: 1000, weight: .thin, design: .monospaced))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width * 0.9)
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
    ContentView()
}

