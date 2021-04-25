//
//  CheckInsOnboardingView.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI

struct CheckInsOnboardingView: View {
    @ObservedObject var viewModel: CheckinsOnboardingViewModel
    @State var child: Date?
    
    
    init(viewModel: CheckinsOnboardingViewModel) {
        self.viewModel = viewModel
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        ZStack {
            AquaIslandSmaltBlueBackgroundView()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    SUILottieView(name: "checkIns_onboarding_card_animation", loopMode: .playOnce, shouldAnimate: $viewModel.shouldAnimate)
                        .height(240)
                    
                    titleLabel
                        .padding(.top, 25)
                        .padding([.leading, .trailing], 30)
                    
                    descriptionLabel
                        .padding([.leading, .trailing], 30)
                    
                    secondaryTitleLabel
                        .padding(.top, 24)
                        .padding([.leading, .trailing], 30)
                    
                    secondaryDescriptionLabel
                        .padding([.leading, .trailing], 30)
                    
                    Spacer()
                    
                    if viewModel.state == CheckinsOnboardingViewModel.State.sleep {
                        rateSleepView
                            .padding([.leading, .trailing], 30)
                            .transition(.slide)
                    }
                    
                    actionButton
                        .padding(.top, 30)
                        .padding([.leading, .trailing], 30)
                }
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 16)
            }
           
        }
        .navigationBarTitle("", displayMode: .inline)
        
    }
    
    var titleLabel: some View {
        Text(viewModel.state.titleText)
            .font(.title)
            .foregroundColor(Color.white)
    }
    
    var descriptionLabel: some View {
        Text(viewModel.state.descriptionText)
            .foregroundColor(Color.white)
    }
    
    var secondaryTitleLabel: some View {
        Text(viewModel.state.secondaryTitleText)
            .foregroundColor(Color.white)
            .bold()
    }
    
    var secondaryDescriptionLabel: some View {
        Text(viewModel.state.secondaryDescriptionText)
            .foregroundColor(Color.white)
    }
    
    var rateSleepView: some View {
        VStack(alignment: .leading) {
            Text("What time works best for you?")
                .foregroundColor(Color.white)
                .bold()
            
            HStack {
                Text("Rate my sleep at:")
                    .padding()
                
                Spacer()
                
                DatePickerTextField(placeHolder: "Set time", date: self.$child)
                    .width(80)
                    .overlay(Rectangle().frame(height: 2).foregroundColor(Color.black), alignment: .bottom)
                
            }
            .maxWidth(.infinity)
            .height(64)
            .background(Color.white.opacity(0.7))
            .cornerRadius(10)
            .padding(.top, 5)
        }
    }
    
    var actionButton: some View{
        Button(viewModel.state.actionButtonText, action: {
            withAnimation {
                viewModel.handleActionButtonTap()
            }
        })
        .maxWidth(.infinity)
        .height(60)
        .background(Color.white.opacity(0.7))
        .cornerRadius(20)
    }
}

struct CheckInsOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckInsOnboardingView(viewModel: CheckinsOnboardingViewModel())
        }
    }
}
