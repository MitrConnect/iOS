//
//  Datatype.swift
//  Mitr
//
//  Created by Stavan Gandhi on 4/6/25.
//

import SwiftUI

struct UserProfile {
    var id: String
    var nickName: String
    var displayName: String
    var email: String
    var createdAt: Date
    var lastActive: Date
    var diaryList: [String]     // List of Ref to each diaries
    var followerCount: Int
    var followingCount: Int
    var journalCount: Int
    var favJournalCount: Int
    var aiAgent: String         // Ref to AiAgent
    var achievements: String    // Ref to Achievements
    
    
    init() {
        
        self.id = ""
        self.nickName = ""
        self.displayName = ""
        self.email = ""
        self.createdAt = Date()
        self.lastActive = Date()
        self.diaryList = []
        self.followerCount = 0
        self.followingCount = 0
        self.journalCount = 0
        self.favJournalCount = 0
        self.aiAgent = ""
        self.achievements = ""
    }
    
    mutating func setID(param : String) { self.id = param }
    mutating func setNickName(param : String?) { self.nickName = param ?? "" }
    mutating func setDisplayName(param : String?) { self.displayName = param ?? "" }
    mutating func setEmail(param : String?) { self.email = param ?? "" }
    mutating func setCreatedAt(param : Date?) { self.createdAt = param ?? Date() }
    mutating func setLastActive(param : Date) { self.lastActive = param }
    mutating func setDiaryList(param : [String]) { self.diaryList = param }
    mutating func setFollowerCount(param : Int) { self.followerCount = param }
    mutating func setFollowingCount(param : Int) { self.followingCount = param }
    mutating func setJournalCount(param : Int) { self.journalCount = param }
    mutating func setFavJournalCount(param : Int) { self.favJournalCount = param }
    mutating func setAiAgent(param : String) { self.aiAgent = param }
    mutating func setAchievements(param : String) { self.achievements = param }
}

