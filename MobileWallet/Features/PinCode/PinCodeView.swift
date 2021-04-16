//
//  PinCodeView.swift
//  MobileWallet
//
//  Created by karollo on 16/04/2021.
//

import SwiftUI

struct PinCodeView: View {
    @ObservedObject var viewModel: PinCodeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        VStack {
            ZStack {
                Image("very-big-background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 16) {
                    Logo()
                    
                    Text("Enter your YayPay Pin")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    
                    Text("augusta@yaypay")
                        .foregroundColor(Color.white)
                    
                    HStack(spacing: 25){
                        ForEach(1..<5) { index in
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(viewModel.isCompleted(for: index) ? Color.white : Color.white.opacity(0.3))
                        }
                        .padding(.top, 100)
                    }
                    
                    
                }.offset(y: 20)
            }
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(viewModel.buttonTypes, id: \.self) { type in
                    makeButton(with: type)
                }
            }
            .padding(20)
            .padding(.bottom, 32)
            
        }
        .background(Color("background"))
        .ignoresSafeArea()
        
    }
    
    func makeButton(with type: ButtonType) -> PinCodeButton {
        let viewModel = PinCodeButtonViewModel(type: type)
        viewModel.onTap = { buttonType in
            self.viewModel.handleTap(for: buttonType)
        }
        return PinCodeButton(viewModel: viewModel)
    }
}

struct PinCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeView(viewModel: PinCodeViewModel())
    }
}

struct Logo: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 110, height: 110).foregroundColor(Color.white)
            Image("logo")
        }
        
    }
}
