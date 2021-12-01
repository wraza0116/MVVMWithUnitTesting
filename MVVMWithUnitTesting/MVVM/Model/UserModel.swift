//
//  UserModel.swift
//  MVVMWithUnitTesting
//
//  Created by Wasim Raza on 27/11/21.
//

import UIKit
import Foundation



struct UserModel: Codable {
    
    var id                      : Int
    var token                   : String
    var name                    : String
    var email                   : String
    var email_verified_at       : String
    var username                : String
    var social_login_id         : String
    var last_visit              : String
    var role                    : Int
    var first_name              : String
    var last_name               : String
    var phone                   : String
    var dob                     : String
    var image_url               : String
    var latitude                : String
    var longitude               : String
    var address                 : String
    var city                    : String
    var state                   : String
    var zip                     : String
    var cbd_min                 : Int
    var cbd_max                 : Int
    var thc_min                 : Int
    var thc_max                 : Int
    var terpenes                : Int
    var created_at              : String
    var updated_at              : String
    var terpenes_preferences    : [String]
    var user_friend             : UserFriend?
    var logins                  : [LoginData]
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        token = try values.decodeIfPresent(String.self, forKey: .token) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at) ?? ""
        username = try values.decodeIfPresent(String.self, forKey: .username) ?? ""
        social_login_id = try values.decodeIfPresent(String.self, forKey: .social_login_id) ?? ""
        last_visit = try values.decodeIfPresent(String.self, forKey: .last_visit) ?? ""
        role = try values.decodeIfPresent(Int.self, forKey: .role) ?? -1
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name) ?? ""
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name) ?? ""
        phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
        dob = try values.decodeIfPresent(String.self, forKey: .dob) ?? ""
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url) ?? ""
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude) ?? ""
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude) ?? ""
        address = try values.decodeIfPresent(String.self, forKey: .address) ?? ""
        city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
        state = try values.decodeIfPresent(String.self, forKey: .state) ?? ""
        zip = try values.decodeIfPresent(String.self, forKey: .zip) ?? ""
        cbd_min = try values.decodeIfPresent(Int.self, forKey: .cbd_min) ?? 0
        cbd_max = try values.decodeIfPresent(Int.self, forKey: .cbd_max) ?? 0
        thc_min = try values.decodeIfPresent(Int.self, forKey: .thc_min) ?? 0
        thc_max = try values.decodeIfPresent(Int.self, forKey: .thc_max) ?? 0
        terpenes = try values.decodeIfPresent(Int.self, forKey: .terpenes) ?? -1
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        user_friend = try values.decodeIfPresent(UserFriend.self, forKey: .user_friend) ?? nil
        terpenes_preferences = try values.decodeIfPresent([String].self, forKey: .terpenes_preferences) ?? [String]()
        logins = try values.decodeIfPresent([LoginData].self, forKey: .logins) ?? [LoginData]()
    }
    
    func saveUser() {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(self) {
            let userDefaults = UserDefaults.standard
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: data)
            userDefaults.setValue(encodedData, forKey: "UserInfo")
            userDefaults.synchronize()
        }
    }
    
    static func retrieveUser() -> UserModel? {
        //let userDefaults = UserDefaults.standard
        let decoded = UserDefaults.standard.object(forKey: "UserInfo") as? Data
        if decoded != nil {
            let userData =  NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as! Data
            let user = try? JSONDecoder().decode(UserModel.self, from: userData)
            return user
        }
        return nil
    }
    
   static func removeUserSession() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "UserInfo")
        userDefaults.synchronize()
    }
    
   static func isLoggedIn() -> Bool {
    if UserModel.retrieveUser() != nil {
            return true
        }
        return false
    }
}


// MARK: - UserFriend
struct UserFriend: Codable {
    var id, fromUserID, toUserID: Int
    var status, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case fromUserID = "from_user_id"
        case toUserID = "to_user_id"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        fromUserID = try values.decodeIfPresent(Int.self, forKey: .fromUserID) ?? -1
        toUserID = try values.decodeIfPresent(Int.self, forKey: .toUserID) ?? -1
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}

struct LoginData: Codable {
    var id, role: Int
    var deviceToken, sessionID, timezone: String
    var userID: Int
    var createdAt: String
    var deviceType: Int
    var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, role
        case deviceToken = "device_token"
        case sessionID = "session_id"
        case timezone
        case userID = "user_id"
        case createdAt = "created_at"
        case deviceType = "device_type"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        role = try values.decodeIfPresent(Int.self, forKey: .role) ?? -1
        userID = try values.decodeIfPresent(Int.self, forKey: .userID) ?? -1
        deviceType = try values.decodeIfPresent(Int.self, forKey: .deviceType) ?? -1
        deviceToken = try values.decodeIfPresent(String.self, forKey: .deviceToken) ?? ""
        sessionID = try values.decodeIfPresent(String.self, forKey: .sessionID) ?? ""
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone) ?? ""
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
