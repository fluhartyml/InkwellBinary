//
//  BedsideDayView.swift
//  InkwellBinary
//
//  Created by Michael Fluharty on 10/3/25.
//

import SwiftUI
import Combine

struct BedsideDayView: View {
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Text(timeString)
                    .font(.system(size: 1000, weight: .bold, design: .monospaced))
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
    BedsideDayView()
}
