//
//  PinCodeButton.swift
//  MobileWallet
//
//  Created by karollo on 16/04/2021.
//

import SwiftUI

struct PinCodeButton: View {
    let viewModel: PinCodeButtonViewModel
    
    var body: some View {
        Button(action: {
                viewModel.handleTap()
        }, label: {
            switch viewModel.type {
            case .value(let value): Text(value)
            case .backSpace: Image(systemName: "delete.left.fill")
            }
        })
        .font(.title)
        .foregroundColor(Color.black)
        .padding(25)
        .clipShape(Circle())

    }
    
   
}

struct PinCodeButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PinCodeButton(viewModel: PinCodeButtonViewModel(type: .value("9")))
                .frame(width: 100, height: 100)
            
            PinCodeButton(viewModel: PinCodeButtonViewModel(type: .backSpace))
                .frame(width: 100, height: 100)
        }
    }
}
