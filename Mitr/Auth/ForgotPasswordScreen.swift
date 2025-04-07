//
//  ForgotPasswordScreen.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    
    @State var geometry: GeometryProxy
    var goToLoginScreen: () -> Void
    
    @State var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Forgot password?")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(Color(hex: 0x882DD1))
                Text("Let’s get you back in!")
                    .font(.system(size: 15))
            }
            
            VStack(alignment: .leading, spacing: 25) {
                TextField("Email", text: $email)
                    .textFieldStyle(OutlinedTextFieldStyle())
            }
            
            Spacer()
                .frame(height: geometry.size.height * 0.575)
                .fixedSize()
            
            Button(action: {
                
            }) {
                Text("Reset Password")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 20)
                    .foregroundStyle(Color.white)
                    .background(Color(hex: 0x140DA4))
                    .cornerRadius(8)
            }
            
            HStack(spacing: 5) {
                Text("Return to")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.black)
                
                Button(action: {
                    goToLoginScreen()
                }) {
                    Text("Log in")
                        .font(.system(size: 15))
                        .foregroundStyle(Color(hex: 0x882DD1))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
