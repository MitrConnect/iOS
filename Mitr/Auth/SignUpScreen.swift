//
//  SignUpScreen.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State var geometry: GeometryProxy
    var goToLoginScreen: () -> Void
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPwd: String = ""
    
    @State var showAlert = false
    @State var alertMsg = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Get started with us!")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(Color(hex: 0x882DD1))
                Text("Unlock a world of meaningful conversations!")
                    .font(.system(size: 15))
            }
            
            VStack(alignment: .leading, spacing: 25) {
                TextField("Display Name", text: $name)
                    .textFieldStyle(OutlinedTextFieldStyle())
                TextField("Email", text: $email)
                    .textFieldStyle(OutlinedTextFieldStyle())
                SecureField("Create Password", text: $password)
                    .textFieldStyle(OutlinedTextFieldStyle())
                SecureField("Confirm Password", text: $confirmPwd)
                    .textFieldStyle(OutlinedTextFieldStyle())
            }
            
            Spacer()
                .frame(height: geometry.size.height * 0.12)
                .fixedSize()
            
            Button(action: {
                userAuth.create(name, email, password, confirmPwd) { error in
                    guard (error == nil) else {
                        self.alertMsg = error!
                        self.showAlert = true
                        return
                    }
                }
            }) {
                Text("Create Account")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 20)
                    .foregroundStyle(Color.white)
                    .background(Color(hex: 0x140DA4))
                    .cornerRadius(8)
            }
            
            HStack(spacing: 5) {
                Text("Already have an account?")
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
        .alert(self.alertMsg, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
