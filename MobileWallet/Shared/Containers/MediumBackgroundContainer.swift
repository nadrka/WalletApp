//
//  MediumBackgroundContainer.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI

struct MediumBackgroundContainer<Content: View>: View {
    let content: () -> Content
    var body: some View {
        VStack(spacing: 24) {
            Image("medium-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(width: 395, height: 306)
            Spacer()
        }
        .background(Color("background"))
        .ignoresSafeArea()
        .overlay(self.content)
    }
}

struct MediumBackgroundContainer_Previews: PreviewProvider {
    static var previews: some View {
        MediumBackgroundContainer {
            Text("Haba baba")
        }
    }
}
