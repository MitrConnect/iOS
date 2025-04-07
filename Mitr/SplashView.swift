//
//  SplashView.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//


import SwiftUI

struct SplashView: View {
    
    @State private var iconOffset: CGFloat = 0  // Start in the center
    @State private var textOffset: CGFloat = 0  // Start in the center
    @State private var isVisible = false
    
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .offset(x: iconOffset)
                    .opacity(isVisible ? 1 : 0)
                Text("Mitr")
                    .font(.system(size: 30))
                    .offset(x: textOffset)
                    .opacity(isVisible ? 1 : 0)
            }
            .foregroundStyle(Color.white)
            .onAppear {
                withAnimation(.easeOut(duration: 1.0)) {
                    iconOffset = -25
                    textOffset = 25
                    isVisible = true
                }
                withAnimation(.easeOut(duration: 1.0).delay(2.0)) {
                    iconOffset = 0
                    textOffset = 0
                    isVisible = false
                }
            }
        }
    }
}
