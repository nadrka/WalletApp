//
//  MobileWalletApp.swift
//  MobileWallet
//
//  Created by karollo on 16/04/2021.
//

import SwiftUI

@main
struct MobileWalletApp: App {

    var body: some Scene {
        WindowGroup {
            CheckInsOnboardingView(viewModel: CheckinsOnboardingViewModel())
        }
    }
}
