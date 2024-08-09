//
//  ProgressBarView.swift

import Foundation
import SwiftUI

struct ProgressBarView: View {
    @State private var barLength: CGFloat = 0
    
    var currentProgress: CGFloat
    var maxProgress: CGFloat
    
    var innerProgressBarLength: CGFloat {
        let ratio = currentProgress / maxProgress
        return max(0, min(barLength * ratio, barLength - 2))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.cRed, lineWidth: 4)
                .background {
                    RoundedRectangle(cornerRadius: 8.0)
                        .fill(.cDarkRed)
                }
            
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex: "#D45900"),
                            Color(hex: "#FFB800")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 24)
                .padding(4)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 320)
        .shadow(color: .cBlack, radius: 16, x: 0, y: 12)
        .readSize { self.barLength = $0.width }
    }
}

#Preview {
    ProgressBarView(currentProgress: 50, maxProgress: 280)
}
