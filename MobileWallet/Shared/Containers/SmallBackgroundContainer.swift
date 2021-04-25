//
//  SmallBackgroundContainer.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI

struct SmallBackgroundContainer<Content: View>: View {
    let content: () -> Content
    var body: some View {
        VStack(spacing: 24) {
            Image("small-background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    Text("Send Money")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.leading, 20)
                    ,
                    alignment: .bottomLeading
                )
                
            Spacer()
        }
        .background(Color("background"))
        .ignoresSafeArea()
        .overlay(self.content)
    }
}

struct SmallBackgroundContainer_Previews: PreviewProvider {
    static var previews: some View {
        SmallBackgroundContainer {
            VStack {
                Text("Hello")
            }
        }
    }
}
