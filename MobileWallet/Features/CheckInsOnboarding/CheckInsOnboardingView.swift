//
//  CheckInsOnboardingView.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI

struct CheckInsOnboardingView: View {
    @ObservedObject var viewModel: CheckinsOnboardingViewModel
    @State var child: Date? = Date()
    @State private var showingSheet = false
    
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
                    LottieView(name: "checkIns_onboarding_card_animation", loopMode: .playOnce)
                        .height(240)
                    
                    Text(viewModel.state.titleText)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding(.top, 25)
                    
                    Text(viewModel.state.descriptionText)
                        .foregroundColor(Color.white)
                    
                    Text(viewModel.state.secondaryTitleText)
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.top, 24)
                    
                    Text(viewModel.state.secondaryDescriptionText)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
//                    if viewModel.state == CheckinsOnboardingViewModel.State.sleep {
                    VStack(alignment: .leading) {
                        Text("What time works best for you?")
                            .foregroundColor(Color.white)
                            .bold()
                        
                        HStack {
                            Text("Rate my sleep at:")
                                .padding()
                            
                            Spacer()
                            
                            DatePickerTextField(placeHolder: "Set time", date: self.$child)
                                .width(100)
                        }
                        .maxWidth(.infinity)
                        .height(64)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 5)
                    }
                    .animation(.spring())
//                    }
                    
                    Button(viewModel.state.actionButtonText, action: {
                        viewModel.handleActionButtonTap()
                        self.showingSheet.toggle()
                    })
                    .maxWidth(.infinity)
                    .height(60)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(20)
                    .padding(.top, 30)
                }
                .padding(.bottom, 16)
                .padding([.leading, .trailing], 30)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
  
    }
    
}

struct CheckInsOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckInsOnboardingView(viewModel: CheckinsOnboardingViewModel())
        }
        
    }
}
//
//struct RateSleepView: View {
//    var body: some View {
//
//    }
//}

