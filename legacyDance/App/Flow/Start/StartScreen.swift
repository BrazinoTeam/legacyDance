//
//  LoadingScreen.swift

import SwiftUI
import Combine

struct StartScreen: View {
    @ObservedObject var loadignViewModel: StartViewModel
    @State private var loadingProgress: CGFloat = 0
    
    var body: some View {
        VStack {
            ProgressBarView(currentProgress: loadingProgress, maxProgress: 280)
                .padding(.bottom, 52.autoSize)
            Text("Please, wait")
                .font(Font.custom("MacondoSwashCaps-Regular", size: 32))
                .foregroundStyle(.cYellow)
        }
        .padding(.bottom, 100.autoSize)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .backgroundImage(image: .bgStart)
        .onChange(of: loadignViewModel.isAnimating) { animating in
            if animating {
                withAnimation(.linear(duration: 2)) {
                    loadingProgress = 280
                }
            }
        }
    }
}

#Preview {
    StartScreen(loadignViewModel: StartViewModel())
}
