//
//  AppConstant.swift
//  Feed
//
//  Created by Wasim Raza on 13/12/18.
//  Copyright © 2018 Wasim Raza. All rights reserved.
//

import Foundation
import UIKit
//import FirebaseDatabase

@available(iOS 13.0, *)
let sceneDelegate       = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate

//let appControllerManger = (UIApplication.shared.delegate as! AppDelegate).appControllerManager
let appDelegate         = UIApplication.shared.delegate as! AppDelegate
let BASE_URL            = "http://18.235.249.31/"
let IMG_BASE_URL        = "https://s3.amazonaws.com/www.tokeddev.com/"
// MARK:- Data Constants
/*
 define("TERPENE_MYRCENE", 1);
 define("TERPENE_CARYOPHYLLENE", 2);
 define("TERPENE_PINENE", 4);
 define("TERPENE_HUMULENE", 8);
 define("TERPENE_TERPINOLENE", 16);
 define("TERPENE_LIMONENE", 32);
 define("TERPENE_OCIMENE", 64);
 */

let terpenesArray = ["Myrcene","Pinene","Caryophyllene","Limonene", "Terpinolene", "Humulene", "Ocimene", "Linalool"]
let tellUsLikeArray = ["😇 Euphoric", "😌 Relaxed", "🧐 Creative", "😁 Energetic", "😃 Fits of laughter"]
let tellUsExperienceArray = ["Dry mouth", "Anxiety", "Drowsiness", "Anti-social", "Throat irritation", "Other"]

// MARK:- APIs
struct URL_CONSTANT {
    
    static let FIREBASE_NOTIFICATION_URL    = "https://fcm.googleapis.com/fcm/send"
    static let USER_URL_CONCATE             = "api/user/"
    static let FRIEND_URL_CONCATE           = "api/friend/"
    static let PRODUCT_URL_CONCATE          = "api/product/"
    static let BRAND_URL_CONCATE            = "api/brand/"
    static let SELLER_URL_CONCATE           = "api/seller/"
    
    //MARK:------------------ User API ------------------
    
    //Post
    static let USER_DETAIL                  = USER_URL_CONCATE+"detail/"
    static let LOGIN                        = USER_URL_CONCATE+"login"
    static let FORGOT_PASSWORD              = USER_URL_CONCATE+"forgot-password"
    static let REGISTER                     = USER_URL_CONCATE+"register"
    static let SOCIAL_LOGIN                 = USER_URL_CONCATE+"social-login"
    static let USER_UPDATE                  = USER_URL_CONCATE+"update"
    static let USER_UPDATE_CBD              = USER_URL_CONCATE+"update-cbd"
    static let USER_UPDATE_THC              = USER_URL_CONCATE+"update-thc"
    static let USER_UPDATE_LOCATION         = USER_URL_CONCATE+"update-location"
    static let USER_UPDATE_TERPENES         = USER_URL_CONCATE+"update-terpenes"
    
    //GET
    static let USER_FILTER                  = USER_URL_CONCATE+"filter"
    static let USER_COUNT_ACTIVE            = USER_URL_CONCATE+"count-active"
    static let USER_PRODUCT_ADDED_EXPLORED  = USER_URL_CONCATE+"products"
    static let USER_TRACKING_LIST           = USER_URL_CONCATE+"tracking"
    static let USER_COUNT_ACTIVE_LIST       = USER_URL_CONCATE+"count-active"
    static let USER_MY_LIST_HISTORY         = USER_URL_CONCATE+"products"
    //static let USER_TRACKING_LIST           = USER_URL_CONCATE+"tracking-list"
    static let USER_LIST_BY_IDS             = USER_URL_CONCATE+"list-by-ids"
    
    
    
    //Delete
    static let LOGOUT                       = USER_URL_CONCATE+"logout"
    
    //MARK:------------------ Product API ------------------
    
    static let PRODUCT_SUB_CATEGORIES_WITH_SEARCH  = PRODUCT_URL_CONCATE+"list"
    static let PRODUCT_CATEGORIES           = PRODUCT_URL_CONCATE+"categories"
    static let PRODUCT_DETAIL               = PRODUCT_URL_CONCATE+"detail/"
    static let PRODUCT_ADD_TO_MY_LIST       = PRODUCT_URL_CONCATE+"add-to-my-list/"
    static let PRODUCT_ADD_TO_HISTORY       = PRODUCT_URL_CONCATE+"add-to-history/"
    static let PRODUCT_ADD_SURVEY           = PRODUCT_URL_CONCATE+"add-survey"
    static let PRODUCT_REMOVE_FROM_MY_LIST  = PRODUCT_URL_CONCATE+"remove-from-my-list/"
    static let PRODUCT_ADD_TO_EXPLORE       = PRODUCT_URL_CONCATE+"add-to-explore/"
    static let PRODUCT_ADD_TO_IMPRESSION    = PRODUCT_URL_CONCATE+"add-to-impression/"

    
    //MARK:------------------ Friends API ------------------
    
    //POST
    static let FRIEND_REQUEST_ADD           = FRIEND_URL_CONCATE+"request-add"
    static let FRIEND_REQUEST_ACCEPT        = FRIEND_URL_CONCATE+"accept-request"
    static let FRIEND_REQUEST_DECLINE       = FRIEND_URL_CONCATE+"decline-request"
    
    //GET
    static let FRIEND_REQUEST_LIST          = FRIEND_URL_CONCATE+"requests"
    static let FRIEND_LIST                  = FRIEND_URL_CONCATE+"list"
    static let FRIEND_USER_SEARCH           = USER_URL_CONCATE+"filter"
    
    //DELETE
    static let FRIEND_REMOVE                = FRIEND_URL_CONCATE+"remove"
    
    
    //MARK:------------------ Seller API ------------------
    
    //GET
    static let SELLER_LIST_BY_PRODUCT       = SELLER_URL_CONCATE+"product/"
    
    
}

struct TITLE_CONSTANT {
    static let TERMS_OF_SERVICE         = "Terms of Service"
    static let PRIVACY_POLICY           = "Privacy Policy"
    
}

// MARK:- Third Party key Constant
struct ThirdPartyKeyConstant {
    //Google
    //static let GOOGLE_API_KEY       = "AIzaSyAQCYfbho6JwTOv3jEzNjzLrCqLEJ09XPc"
    static let GOOGLE_API_KEY       = "AIzaSyAq10IejEf1ZSCHZFou8Xk2TEerKWFEtRM"
    static let FIREBASE_SERVER_KEY  = "AAAAicHCZg8:APA91bG_GhJ7KeayeJrVaN1ZbwYR3XhArtYChalEdgqNuJf7qTu1zyMNa6BYuTOhzg4qpy0qudBxaoNqHLY-6tC1d3iyROiW7pCKoWHDp_jsGsikj3A59ewyGXioO7aNZFXgP6z3v05m"
}

// MARK:- List of Constants
struct Constant {
    static let APP_VERSION                          = "app_version"
    static let SELECTED_IMAGE                       = "selected_image"
    
    //Key Constant
    static let kRefreshData                         = "kRefreshData"
    static let ktAgeDeclaration                     = "ktAgeDeclaration"
    static let kLocationDeny                        = "kLocationDeny"
    static let kTabBarIndex                         = "kTabBarIndex"
    static let kDeviceToken                         = "kdeviceToken "
    static let kProductAdded                        = "ProductAdded"
    static let kProductAddedInHistory               = "ProductAddedInHistory"
    static let kProductRemoved                      = "ProductRemoved"
    static let kIsFirstLaunch                       = "kIsFirstLaunch"
    static let kNotificationChat                    = "kChatNotification"
    static let kNotificationFriendRequest           = "kFriendRequestNotification"
    
    static let Firebase_User_BadgeCount             = "badgeCount"
    static let Firebase_User_DeviceToken            = "deviceToken"
    static let Firebase_User_ChatWithUsers          = "chatWithUsers"
    
    static let Notification_Friend_Request          = "friend_request"
    static let Notification_Chat                    = "chat"
    
    static let SHARABLE_LINK    = "https://apps.apple.com/us/app/toked"
    static let SHARABLE_TEXT    = "I found the Toked app valuable and I think you will too. Here’s a link to download it in the App Store:\n\n"+Constant.SHARABLE_LINK
    
    
    
   /* struct refs
    {
        static let databaseRoot         = Database.database().reference()
        static let databaseMessages     = databaseRoot.child("messages")
        static let databaseUsers        = databaseRoot.child("users")
        //static let databaseBadgeCount   = databaseRoot.child("badgeCount")
    }*/
}

// MARK:- Alert of Constants
struct AlertMessageConstant {
    
    static let APP_ALERT_TITLE              = "Toked"
    static let NO_INTERNET                  = "You are offline, connect to the internet."
    static let ENTER_FIRST_NAME             = "Please enter your first name."
    static let ENTER_LAST_NAME              = "Please enter your last name."
    static let ENTER_USERNAME               = "Please enter your username."
    static let ENTER_VALID_USERNAME         = "Username must contain at least 8 characters."
    static let ENTER_EMAIL_ADDRESS          = "Please enter your email address."
    static let ENTER_EMAIL_VALID_ADDRESS    = "Please enter a valid email address."
    static let ENTER_PASSWORD               = "Please enter your password."
    static let ENTER_OLD_PASSWORD           = "Please enter your old password."
    static let ENTER_VALID_OLD_PASSWORD     = "Old password must contain minimum 8 characters, at least contain 1 number, uppercase and lowercase letter and 1 sepcial symbol."
    static let ENTER_NEW_PASSWORD           = "Please enter your new password."
    static let ENTER_VALID_PASSWORD         = "Password must contain minimum 8 characters, at least contain 1 number, uppercase and lowercase letter and 1 sepcial symbol."
    static let ENTER_VALID_NEW_PASSWORD     = "New Password must contain minimum 8 characters, at least contain 1 number, uppercase and lowercase letter and 1 sepcial symbol."
    static let ENTER_CONFIRM_PASSWORD       = "Please enter confirm password."
    static let ENTER_VALID_CONFIRM_PASSWORD = "Confirm password must contain minimum 8 characters, at least contain 1 number, uppercase and lowercase letter and 1 sepcial symbol."
    static let PASSWORD_NOT_MATCH           = "Password and confirm password does not match."
    static let PASSWORD_NOT_MATCH_NEW       = "New password and confirm password does not match."
    static let ENTER_PHONE_NUMBER           = "Please enter your phone number."
    static let ENTER_VALID_PHONE_NUMBER     = "Please enter a valid phone number."
    static let ENTER_STREET_ADDRESS         = "Please enter street address."
    static let ENTER_BANK_NAME              = "Please enter bank name."
    static let ENTER_CARD_NUMBER            = "Please enter card number."
    static let ENTER_VALID_CARD_NUMBER      = "Please enter a valid valid number."
    static let ENTER_ROUTING_NUMBER         = "Please enter routing number."
    static let ENTER_VALID_ROUTING_NUMBER   = "Please enter a valid routing number."
    static let ENTER_ACCOUNT_NUMBER         = "Please enter account number."
    static let ENTER_VALID_ACCOUNT_NUMBER   = "Please enter a valid account number."
    static let ENTER_DATE_OF_BIRTH          = "Please enter your date of birth."
    static let SELECET_PROFILE_PIC          = "Please select profile image."
    
    static let AGREE_WITH_TERMS             = "Please check terms of service & privacy policy."

    static let NO_USER                      = "No matching users found."
    static let FEEDBACK_MESSAGE             = "Thank you for your valuable feedback."
    static let SIGN_OUT_MESSAGE             = "Are you sure that you want to logout?"
    
   
}

// MARK:- ResponseKey Constants
enum ResponseKey: String {
    case data           = "data"
    case error          = "error"
    case status         = "status"
    case message        = "message"
    case result         = "result"
    case OK             = "OK"
    case UNAUTHORIZED   = "UNAUTHORIZED"
    case ERROR          = "ERROR"
    case errorMessage   = "An unexpected response was received."
    case validation_error = "validation_error"
}

