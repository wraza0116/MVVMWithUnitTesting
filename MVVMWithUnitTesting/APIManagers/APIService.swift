//
//  APIService.swift
//  MVVMWithUnitTesting
//
//  Created by Simpalm iOS on 30/11/21.
//

import UIKit

class APIService: NSObject {

    func apiForLoginUser(email:String, password:String, complitionHandler: @escaping (_ userData:UserModel?, _ message: String?) -> Void)  {
        
        var deviceToken = UserDefaults.standard.value(forKey: Constant.kDeviceToken) as? String
        deviceToken = !AppDelegate.DEVICEID.isEmpty ? AppDelegate.DEVICEID : ((deviceToken == nil) || (deviceToken?.isEmpty ?? false) ) ? UIDevice.current.identifierForVendor?.uuidString : deviceToken
        
        let param = ["username":email, "password":password, "device_type":"2", "device_token":deviceToken!, "timezone":TimeZone.current.identifier]
        
        WebServicesManager.shared.postRequest(url: URL_CONSTANT.LOGIN, param: param) { isSuccess, result, message in
            if isSuccess {
                let token = result!["token"] as! String
                var userData = result!["user"] as! [String:Any]
                userData["token"] = token
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: userData, options: .prettyPrinted)
                    let user = try JSONDecoder().decode(UserModel.self, from: jsonData)
                    complitionHandler(user,message)
                }
                catch let error {
                    complitionHandler(nil,error.localizedDescription)
                }
            }else{
                complitionHandler(nil,message)
            }
        }
        
        
    }
}
