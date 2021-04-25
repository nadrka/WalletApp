//
//  CheckinsOnboardingStartViewModel.swift
//  cove-ios
//
//  Created by Karol Nadratowski on 21/04/2021.
//

import Foundation
import Combine

protocol ViewModel {
    
}

final class CheckinsOnboardingViewModel: ObservableObject, ViewModel {
    @Published var state: State = .stress
    @Published var shouldAnimate = false
    
    func handleActionButtonTap() {
        switch state {
        case .stress: handleStressActionButtonTap()
        case .sleep: handleSleepActionButtonTap()
        }
    }
    
    private func handleStressActionButtonTap() {
        state = .sleep
        shouldAnimate = true
    }
    
    private func handleSleepActionButtonTap() {
        
    }
}

extension CheckinsOnboardingViewModel {
    enum State {
        case stress
        case sleep
        
        var titleText: String {
            switch self {
            case .stress: return "Stress check-ins"
            case .sleep: return "Sleep check-ins"
            }
        }
        
        var descriptionText: String {
            switch self {
            case .stress: return "We offer stress check-ins at the end of each Cove session, or you can manually check in from the History tab."
            case .sleep: return "Sleep check-ins will only appear once per day. We recommend logging how you slept within 30 minutes of waking up."
            }
        }
        
        var secondaryTitleText: String {
            switch self {
            case .stress: return "Track your stress reduction"
            case .sleep: return "Track your sleep improvement"
            }
        }
        
        var secondaryDescriptionText: String {
            switch self {
            case .stress: return "Regular stress check-ins help you stay consistent, notice improvement over time, or see if you’re not making progress so you can adjust your Cove practice."
            case .sleep: return "Sleep check-ins help you note  improvement in your quality of sleep, or see if you’re not making progress so you can adjust your Cove practice."
            }
        }
        
        var actionButtonText: String {
            switch self {
            case .stress: return "Continue"
            case .sleep: return "Done"
            }
        }
    }
}
