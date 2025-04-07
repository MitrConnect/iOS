//
//  MitrApp.swift
//  Mitr
//
//  Created by Stavan Gandhi on 3/1/25.
//

import SwiftUI
import Firebase

@main
struct SagaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var userAuth = UserAuth()
    
    @State var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if self.isActive {
//                NavigationView{
                    if (userAuth.isSignedIn) {
                        ContentView()
                    }  else{
                        AuthView()
                    }
//                }
//                .navigationViewStyle(StackNavigationViewStyle())
            } else {
                SplashView()
                    .onAppear(){
                        userAuth.reload()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.15) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .environmentObject(userAuth)
    }
    
    init(){
        FirebaseApp.configure()
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
