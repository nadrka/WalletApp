//
//  LottieView.swift
//  MobileWallet
//
//  Created by Karol Nadratowski on 23/04/2021.
//

import SwiftUI
import Lottie

struct SUILottieView: UIViewRepresentable {
    var name = "success"
    var loopMode: LottieLoopMode = .loop
    @Binding var shouldAnimate: Bool
   
    func makeUIView(context: Context) -> AnimationView {
        let animationView = AnimationView()

        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        return animationView
    }

    func updateUIView(_ uiView: AnimationView, context: Context) {
        if shouldAnimate {
            uiView.play()
        }
    }
}
