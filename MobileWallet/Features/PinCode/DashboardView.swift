//
//  DashboardView.swift
//  MobileWallet
//
//  Created by karol.nadratowski on 17/04/2021.
//

import SwiftUI
import SwiftUIX

struct DashboardView: View {
    var body: some View {
        MediumBackgroundContainer {
            VStack(spacing: 24) {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16) {
                        AccountInfo()
                        AccountInfo()
                        AccountInfo()
                    }
                    .padding(.leading, 24)
                }
                
                
                VStack(spacing: 16) {
                    ForEach(actions, id: \.self) { action in
                        DashboardOption()
                    }
                }
            }.padding(.bottom)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


let actions = ["Send Money", "Receive Money", "Manage Money", "Offers"]


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct DashboardOption: View {
    var body: some View {
        Color.white
            .frame(height: 75, alignment: .trailing)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(37, corners: [.bottomLeft, .topLeft])
            .padding(.leading, 32)
            .overlay(
                HStack(spacing: 12) {
                    
                    Image(systemName: "envelope.circle.fill")
                        .font(.title)
                    
                    
                    Text("Send Money")
                        .bold()
                    
                    Image(systemName: "chevron.right")
                    
                    
                }
                .foregroundColor(Color("primary"))
                .font(.callout)
                .padding(.leading, 50),
                alignment: .leading
            )
    }
}

struct AccountInfo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Bank Account")
                .font(.caption)
            Text("1273 xxxx xxxx 8771")
                .font(.body)
            
            Text("Current Balance")
                .font(.caption)
                .padding(.top, 16)
            
            Text("$121,700")
                .font(.title)
            
            
            Text("View Statement")
                .foregroundColor(Color("primary"))
                .font(.callout)
                .bold()
                .padding(.top, 40)
        }
        .padding(20)
        .background(VisualEffectBlurView(blurStyle: .systemMaterialLight))
        .cornerRadius(10)
        .frame(width: 200)
    }
}
