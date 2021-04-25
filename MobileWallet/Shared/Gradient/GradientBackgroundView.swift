//
//  GradientView.swift
//  cove-ios
//
//  Created by js on 24/02/2021.
//

import SwiftUI

struct GradientBackgroundView: View {
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    init(colors: [Color],
         startPoint: UnitPoint = .top,
         endPoint: UnitPoint = .bottom) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    var body: some View {
        let gradient = Gradient(colors: colors)
        return LinearGradient(gradient: gradient,
                              startPoint: startPoint,
                              endPoint: endPoint)
            .edgesIgnoringSafeArea(.all)
    }
}
