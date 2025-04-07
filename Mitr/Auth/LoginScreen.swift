//
//  LoginScreen.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State var geometry: GeometryProxy
    var goToSignupScreen: () -> Void
    var goToForgotPwdScreen: () -> Void
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var showAlert = false
    @State var alertMsg = ""
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Hey there!")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(Color(hex: 0x882DD1))
                Text("Let’s pick up where we left off")
                    .font(.system(size: 15))
            }
            
            VStack(alignment: .leading, spacing: 25) {
                TextField("Email", text: $email)
                    .textFieldStyle(OutlinedTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(OutlinedTextFieldStyle())
            }
            
            HStack() {
                Spacer()
                Button(action: {
                    goToForgotPwdScreen()
                }){
                    Text("Forgot Password?")
                        .font(.system(size: 15))
                        .foregroundStyle(Color(hex: 0x882DD1))
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        
            Spacer()
                .frame(height: geometry.size.height * 0.35)
                .fixedSize()
            
            Button(action: {
                userAuth.signIn(email, password) { error in
                    guard (error == nil) else {
                        self.alertMsg = error!
                        self.showAlert = true
                        return
                    }
                }
            }) {
                Text("Login")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 20)
                    .foregroundStyle(Color.white)
                    .background(Color(hex: 0x140DA4))
                    .cornerRadius(8)
            }
            
            HStack(spacing: 5) {
                Text("Don't have an account?")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.black)
                
                Button(action: {
                    goToSignupScreen()
                }) {
                    Text("Sign Up")
                        .font(.system(size: 15))
                        .foregroundStyle(Color(hex: 0x882DD1))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .alert(self.alertMsg, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
