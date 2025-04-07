//
//  ContentView.swift
//  Mitr
//
//  Created by Stavan Gandhi on 3/1/25.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        VStack {
            Text("Hey \(userAuth.profile.displayName)!")
            Button(action: {
                userAuth.signOut()
            }) {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    ContentView()
}
