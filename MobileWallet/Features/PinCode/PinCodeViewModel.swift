//
//  PinCodeViewModel.swift
//  MobileWallet
//
//  Created by karollo on 16/04/2021.
//

import Foundation

class PinCodeViewModel: ObservableObject {
    @Published var pin: [String] = []

    let buttonTypes: [ButtonType] = [.value("1"), .value("2"), .value("3"),
                                     .value("4"), .value("5"), .value("6"),
                                     .value("7"), .value("8"), .value("9"),
                                     .backSpace, .value("0")]
    
    func isCompleted(for index: Int) -> Bool {
        return pin.count >= index
    }
    
    func handleTap(for buttonType: ButtonType) {
        switch buttonType {
        case .value(let code):
            append(code)
        case .backSpace:
            removeLast()
        }
    }
    
    func append(_ code: String) {
        if pin.count < 4  {
            pin.append(code)
            return
        }
        
        print("Code written")
    }
    
    func removeLast() {
        guard pin.count > 0 else {
            return
        }
        
        pin.removeLast()
    }
}
