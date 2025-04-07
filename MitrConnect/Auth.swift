//
//  Auth.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//


import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class UserAuth: ObservableObject {
    @Published var profile: UserProfile = UserProfile()
    @Published var isSignedIn = false
    
    private let AuthenticationRef = Auth.auth()
    
    init() {
        self.reload()
    }
    
    func reload() {
        self.isSignedIn = self.isUserSignedIn()
        
        guard let user = getUser() else {
            return
        }
        
        profile.setID(param: user.uid)
        profile.setDisplayName(param: user.displayName)
        profile.setEmail(param: user.email)
        profile.setCreatedAt(param: user.metadata.creationDate)
        
        print(profile)
    }
}

//  User Login, Create Account, Forgot Password, and Sign Out Functions
extension UserAuth{
    func create(_ name: String, _ email: String, _ pwd: String, _ confirmPwd: String, completion: ((String?) -> Void)? = nil){
        if (pwd != confirmPwd) {
            completion?(self.authErrorCode(code: 00000))
            return
        }
        
        self.AuthenticationRef.createUser(withEmail: email, password: pwd) { (result, error) in
            if let error = error as NSError? {
                completion?(self.authErrorCode(code: error.code))
                return
            }
            
            if let user = result?.user.createProfileChangeRequest() {
                user.displayName = name
                user.commitChanges { commitError in
                    if (commitError as NSError?) != nil {
                        completion?(self.authErrorCode(code: 00002))
                    } else {
                        print("Display name set successfully.")
                    }

                }
            }
            
            print("User Account is successfully Created!")
            
            self.reload()
            
            completion?(nil)
        }
    }
    
    func signIn(_ email: String, _ pwd: String, completion: ((String?) -> Void)? = nil){
        self.AuthenticationRef.signIn(withEmail: email, password: pwd) { (result, error) in
            if let error = error as NSError? {
                completion?(self.authErrorCode(code: error.code))
                return
            }
            
            print("User is successfully Logged In!")
            self.reload()
            completion?(nil)
        }
    }
    
    func signOut(completion: ((String?) -> Void)? = nil){
        do {
            try Auth.auth().signOut()
        } catch let error {
            completion?(error.localizedDescription)
            return
        }
        
        print("User is successfully Signed Out!")
        self.reload()
        completion?(nil)
    }
    
    private func reauthenticate(_ email: String, _ pwd: String, completion: ((String?) -> Void)? = nil){
        let credential = EmailAuthProvider.credential(withEmail: email, password: pwd)
        
        self.AuthenticationRef.currentUser?.reauthenticate(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion?(error?.localizedDescription)
                return
            }
            
            print("User reauthenticate operation is successfully!")
            completion?(nil)
        }
    }
    
    func deactivateAccount(_ email: String, _ pwd: String, _ UserID: String, completion: ((String?) -> Void)? = nil){
        if email.isEmpty || pwd.isEmpty {
            completion?(self.authErrorCode(code: 00001))
        } else{
            self.reauthenticate(email, pwd) { error in
                guard error == nil else{
                    completion?(error)
                    return
                }
                self.AuthenticationRef.currentUser?.delete { error in
                    guard error == nil else {
                        completion?(error?.localizedDescription)
                        return
                    }
                    
                    print("User account is successfully deactivate!")
                    self.reload()
                    completion?(nil)
                }
            }
        }
    }
    
    func resetPassword(_ email: String, completion: ((String?) -> Void)? = nil){
        self.AuthenticationRef.sendPasswordReset(withEmail: email) { error in
            if let error = error as NSError? {
                completion?(self.authErrorCode(code: error.code))
            } else {
                print("User password reset link is successfully sent!")
                completion?(nil)
            }
        }
    }
}

extension UserAuth{
    private func getUser() -> User? {
        return self.AuthenticationRef.currentUser
    }
    
    private func isUserSignedIn() -> Bool {
        return (getUser() != nil)
    }
    
    private func authErrorCode(code: Int) -> String {
        switch code {
        case 00000:
            return "Password and confirm password must be the same"
        case 00001:
            return "To Continue, You must fill up all required fields!"
        case 00002:
            return "Failed to update display name"
        case 17004:
            return "Invalid email or password"
        case 17005:
            return "The user account has been disabled by an admin"
        case 17007:
            return "Email already in use"
        case 17008:
            return "The email address is badly formatted"
        case 17009:
            return "The password is invalid or missing"
        case 17010:
            return "Requests are blocked due to unusual activity"
        case 17011:
            return "There is no user corresponding to this email"
        case 17020:
            return "A network error occurred"
        case 17026:
            return "Password is too weak"
        case 17034:
            return "An email address must be provided"
        default:
            return "Something went Wrong!\nError \(code)"
        }
    }
}
