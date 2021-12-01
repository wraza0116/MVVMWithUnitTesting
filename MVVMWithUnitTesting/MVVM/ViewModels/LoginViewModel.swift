//
//  LoginViewModel.swift
//  MVVMWithUnitTesting
//
//  Created by Simpalm iOS on 30/11/21.
//

import UIKit

class LoginViewModel: NSObject {

    private var apiService : APIService!
    
    private var email : String!
    private var password : String!
    
    private(set) var message : String!
    private(set) var userModel : UserModel! {
           didSet {
               self.bindLoginViewModelToLoginController()
           }
       }
       
    var bindLoginViewModelToLoginController : (() -> ()) = {}
       
       override init() {
           super.init()
           self.apiService =  APIService()
           callFuncToGetUserData()
       }
       
       func callFuncToGetUserData() {
           self.apiService.apiForLoginUser(email: email, password: password) { userData, errorMessage in
               self.userModel = userData
               self.message = errorMessage
           }
       }
}


