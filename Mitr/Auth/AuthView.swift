//
//  AuthView.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//

import SwiftUI

enum AuthEnum {
    case login
    case signup
    case forgotPassword
}

struct AuthView: View {
    
    @State private var showingSheet = false
    @State private var currentScreen: AuthEnum = .login
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 40) {
                logoSection

                introSection
            
                featureIconsSection
                
                closingLine
                
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 60)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.white)
            .sheet(isPresented: $showingSheet) {
                authSheet
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.showingSheet = true
                    }
                }
            }
        }
    }

    private var logoSection: some View {
        VStack{
            Image("Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text("Anytime, Anywhere!")
                .font(.system(size: 20))
                .offset(y: 2)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom, 30)
    }
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Step into a world where every conversation feels real.")
                .font(.system(size: 25, weight: .medium))

            Text("Mitr isn’t just AI — it's your thoughtful friend who listens, understands, and grows with you.")
                .font(.system(size: 15))

            Text("Whether you need:")
                .font(.system(size: 15))
        }
    }

    private var featureIconsSection: some View {
        HStack(spacing: 10) {
            FeatureIcon(systemName: "ellipsis.message.fill", title: "A deep Chat")
            FeatureIcon(systemName: "heart.circle.fill", title: "A little comfort")
            FeatureIcon(systemName: "pencil.and.scribble", title: "...or simply share")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    
    private var closingLine: some View {
        HStack(spacing: 5) {
            Image("Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)

            Text("Mitr")
                .font(.system(size: 15, weight: .bold))

            Text("is always here — just a message away.")
                .font(.system(size: 15))
        }
    }
    
    private var authSheet: some View {
        ZStack {
            GeometryReader { geometry in
                switch currentScreen {
                case .login:
                    LoginScreen(
                        geometry: geometry,
                        goToSignupScreen: {
                            withAnimation(.easeInOut) {
                                currentScreen = .signup
                            }
                        },
                        goToForgotPwdScreen: {
                            withAnimation(.easeInOut) {
                                currentScreen = .forgotPassword
                            }
                        }
                    ).transition(.move(edge: .leading))
                case .signup:
                    SignUpScreen(
                        geometry: geometry,
                        goToLoginScreen: {
                            withAnimation(.easeInOut) {
                                currentScreen = .login
                            }
                        }
                    ).transition(.move(edge: .trailing))
                case .forgotPassword:
                    ForgotPasswordScreen(
                        geometry: geometry,
                        goToLoginScreen: {
                            withAnimation(.easeInOut) {
                                currentScreen = .login
                            }
                        }
                    ).transition(.move(edge: .trailing))
                }
            }
            .padding(.vertical, 60)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.black)
        }
        .presentationDetents([.fraction(0.15), .fraction(0.85)])
        .presentationDragIndicator(.visible)
        .interactiveDismissDisabled()
    }
}

struct FeatureIcon: View {
    var systemName: String
    var title: String
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5).delay(0.2)) {
                        scale = 1
                        opacity = 1
                    }
                }

            Text(title)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .frame(width: 80)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5).delay(0.2)) {
                        opacity = 1
                    }
                }
        }
        .padding(15)
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
    }
}

#Preview {
    AuthView()
}
