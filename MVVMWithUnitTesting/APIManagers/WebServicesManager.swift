//
//  WebServicesManager.swift
//  MVVMWithUnitTesting
//
//  Created by Simpalm iOS on 30/11/21.
//

import UIKit
import Alamofire
import MBProgressHUD

class WebServicesManager: NSObject {
    
    static let shared = WebServicesManager()
    
    func getRequest(url:String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:Any?, _ message: String?) -> Void) {
        
        let urlString = BASE_URL + url
        
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        
        
        AF.request(urlString, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
           
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func postRequest(url:String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:[String:Any]?, _ message: String?) -> Void) {
        
        var urlString = BASE_URL + url
        var headers: HTTPHeaders?
        
        if url == URL_CONSTANT.FIREBASE_NOTIFICATION_URL {
            urlString = URL_CONSTANT.FIREBASE_NOTIFICATION_URL
            headers = HTTPHeaders()
            headers = ["Content-Type":"application/json"
                       ,"Authorization":"key=\(ThirdPartyKeyConstant.FIREBASE_SERVER_KEY)"]
        }else{
            headers = nil
        }
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        AF.request(urlString, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func getRequestWithBearerToken(url:String, token: String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:Any?, _ message: String?) -> Void) {
        
        let urlString = BASE_URL + url
        
        print("token: \(token)")
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(urlString, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as Any
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func postRequestWithBearerToken(url:String, token: String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:Any?, _ message: String?) -> Void) {
                
        let urlString = BASE_URL + url
        print("token: \(token)")
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
       
        AF.request(urlString, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func deleteRequestWithBearerToken(url:String, token: String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:Any?, _ message: String?) -> Void) {
        
        let urlString = BASE_URL + url
        
        print("token: \(token)")
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(urlString, method: .delete, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func putRequestWithBearerToken(url:String, token: String, param: Parameters?, complitionHandler: @escaping (_ status: Bool, _ result:Any?, _ message: String?) -> Void) {
        
        let urlString = BASE_URL + url
        
        print("token: \(token)")
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(urlString, method: .put, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            // Serialize to JSON
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func multipartformPostrequest(url:String, param:Parameters?, imageKey:String, image:UIImage?, imageName:String?, complitionHandler: @escaping (_ status: Bool, _ result:[String:Any]?, _ message: String?) -> Void)  {
        
        // let urlRequest = URLRequest(url: URL(string: BASE_URL + url)!)
        
        let urlString : URLConvertible =  BASE_URL + url as URLConvertible
    
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        
        AF.upload(multipartFormData: { multipartFormData in
            
            if param != nil {
                for (key, value) in param! {
                    if let temp = value as? String {
                        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                        
                    }
                }
            }
            
            if image != nil {
                multipartFormData.append((image?.jpegData(compressionQuality: 0.5))!, withName: imageKey, fileName: imageName, mimeType: "image/jpeg")
            }
            
        }, to: urlString, usingThreshold: UInt64.init(), method: .post, headers: nil, interceptor: nil, fileManager: FileManager.default, requestModifier: nil).uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON { (response) in
            // Serialize to JSON
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    
    func multipartformPostrequestWithBearerToken(url:String, token: String, param:Parameters?, imageKey:String, image:UIImage?, imageName:String?, complitionHandler: @escaping (_ status: Bool, _ result:[String:Any]?, _ message: String?) -> Void)  {
        
        // let urlRequest = URLRequest(url: URL(string: BASE_URL + url)!)
        
        let urlString : URLConvertible =  BASE_URL + url as URLConvertible
        
        print("token: \(token)")
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.upload(multipartFormData: { multipartFormData in
            
            if param != nil {
                for (key, value) in param! {
                    if let temp = value as? String {
                        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                        
                    }
                }
            }
            
            if image != nil {
                multipartFormData.append((image?.jpegData(compressionQuality: 0.5))!, withName: imageKey, fileName: imageName, mimeType: "image/jpeg")
            }
            
        }, to: urlString, usingThreshold: UInt64.init(), method: .post, headers: headers, interceptor: nil, fileManager: FileManager.default, requestModifier: nil).uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON { (response) in
            // Serialize to JSON
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    func uploadFiles(url:String, param:Parameters?, fileKey:String, fileData:Data?, fileName:String?, mimeType: String, complitionHandler: @escaping (_ status: Bool, _ result:[String:Any]?, _ message: String?) -> Void)  {
        
        // let urlRequest = URLRequest(url: URL(string: BASE_URL + url)!)
        
        let urlString : URLConvertible =  BASE_URL + url as URLConvertible
        
        print("URL: \(urlString)")
        print("Params: \(String(describing: param))")
        
        if !Connectivity.isConnectedToInternet {
            self.showAlertOnSelf(message: AlertMessageConstant.NO_INTERNET)
            return
        }
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        /* if !appDelegate.isInternetReachable{
         hud.dismiss(animated: true)
         self.showAlert(message: AlertMessageConstant.NO_INTERNET)
         return
         }*/
        
        AF.upload(multipartFormData: { multipartFormData in
            
            if param != nil {
                for (key, value) in param! {
                    if let temp = value as? String {
                        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                        
                    }
                }
            }
            
            if fileData != nil {
                multipartFormData.append(fileData!, withName: fileKey, fileName: fileName, mimeType: mimeType)
            }
            
        }, to: urlString, usingThreshold: UInt64.init(), method: .post, headers: nil, interceptor: nil, fileManager: FileManager.default, requestModifier: nil).uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON { (response) in
            if response.value != nil {
                let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
                if let JSONString = String(data: jsonData! , encoding: String.Encoding.utf8) {
                    print("Response: \(JSONString)")
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch response.result{
            case .success(let value):
                guard let values = value as? [String: Any],
                      let status = values[ResponseKey.status.rawValue] as? String else {
                    complitionHandler(false, nil, ResponseKey.errorMessage.rawValue )
                    return
                }
                let message = values[ResponseKey.message.rawValue] as! String
                if status != ResponseKey.OK.rawValue {
                    let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                    let validationError = dict?[ResponseKey.validation_error.rawValue] as? [String:Any]
                    
                    if validationError != nil {
                        let key = validationError?.keys.first
                        let validationMessage = validationError?[key!] as? [String]
                        
                        complitionHandler(false,nil,validationMessage?[0])
                        return
                    }
                    complitionHandler(false,nil,message)
                    if status == ResponseKey.UNAUTHORIZED.rawValue {
                        UserModel.removeUserSession()
                        DispatchQueue.main.async {
                            self.setRootViewController(viewController: appControllerManger.splashVC)
                        }
                    }
                    return
                }
                let dict = values[ResponseKey.data.rawValue] as? [String:Any]
                complitionHandler(true,dict,message)
                return
            case .failure(let error):
                print("Request Error: \(String(describing: error))")
                complitionHandler(false,nil,error.localizedDescription)
                return
            }
        }
    }
    
    
    func sendFirebasePushNotification(title:String, deviceToken:[String], message:String, type:String)
    {
        print("sendFirebasePushNotification deviceToken..\(deviceToken)")
        
        if deviceToken.count > 0 {
            
            let param = ["registration_ids":deviceToken,"notification":["body":message,"title":title, "sound":"default","type":type]] as [String:Any]
            
            
            self.postRequest(url: URL_CONSTANT.FIREBASE_NOTIFICATION_URL, param: param) { (isSuccess, result, errorMessage) in
                print("response...\(result)")
                print("errorMessage...\(errorMessage)")
            }
        }
    }

}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
