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
        VStack(spacing: 24) {
            
            Image("medium-background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16) {
                    AccountInfo()
                    AccountInfo()
                    AccountInfo()
                }
                .padding(.leading, 24)
            }
            .offset(y: -50)
            
            
            VStack(spacing: 16) {
                ForEach(actions, id: \.self) { action in
                    DashboardOption()
                }
            }.offset(y: -50)
            
            Spacer()
        }
        .background(Color("background"))
        .ignoresSafeArea()
        
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
        HStack(spacing: 12) {
            
            Image(systemName: "envelope.circle.fill")
                .font(.title)
            
            
            Text("Send Money")
                .bold()
            
            Image(systemName: "chevron.right")
            
            
        }
        .foregroundColor(Color("primary"))
        .font(.callout)
        .frame(height: 75, alignment: .trailing)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(37, corners: [.bottomLeft, .topLeft])
        .padding(.leading, 32)
    }
}

struct AccountInfo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Bank Account")
                .font(.caption)
            Text("1273 xxxx xxxx 8771")
                .font(.body)
            
            Spacer()
            Text("Current Balance")
                .font(.caption)
            Text("$121,700")
                .font(.title)
            
            Spacer()
            Spacer()
            Text("View Statement")
                .foregroundColor(Color("primary"))
                .font(.callout)
                .bold()
        }
        .padding(20)
        .background(VisualEffectBlurView(blurStyle: .))
        .cornerRadius(10)
        .frame(width: 185)
    }
}
