//
//  PinCodeButtonViewModel.swift
//  MobileWallet
//
//  Created by karollo on 16/04/2021.
//

import Foundation

enum ButtonType: Hashable {
    case value(String)
    case backSpace
}

class PinCodeButtonViewModel {
    let type: ButtonType
    
    var onTap: ((ButtonType) -> ())? = nil
    
    init(type: ButtonType) {
        self.type = type
    }
    
    func handleTap() {
        onTap?(type)
    }
}
