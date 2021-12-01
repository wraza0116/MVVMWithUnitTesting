//
//  Extensions.swift
//  Vytex
//
//  Created by Wasim Raza on 25/02/19.
//  Copyright © 2019 Simpalm. All rights reserved.
//

import Foundation
import UIKit
import StoreKit
import CommonCrypto
//import FAPanels
//import JGProgressHUD

let USERDEFAULT: UserDefaults = UserDefaults.standard

//MARK:- UIViewController Extension
extension UIViewController
{
    func showAlert(message:String) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithTitle(title:String, message:String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertOnSelf(message:String) {
        
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "Bicyclette-Bold", size: 22.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "Bicyclette-Regular", size: 16.0)!]
        
        let titleAttrString = NSMutableAttributedString(string: AlertMessageConstant.APP_ALERT_TITLE, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont)
        
        let alertViewController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        alertViewController.setValue(titleAttrString, forKey: "attributedTitle")
        alertViewController.setValue(messageAttrString, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertOnSelfWithCustomTitile(title:String,message:String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithButtonTitle(buttonTitle:String, message:String, style: UIAlertAction.Style) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: style, handler: nil)
        
        alertViewController.addAction(okAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithComplitionHandler(message:String,buttonTitle:String, cancelButtonTitle:String, completionHandler:((UIAlertAction) -> Swift.Void)?) {
        
        //to change font of title and message.
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "Bicyclette-Bold", size: 22.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "Bicyclette-Regular", size: 16.0)!]
        let btnTitleFont = [NSAttributedString.Key.font: UIFont(name: "Bicyclette-Bold", size: 18.0)!]
        
        let titleAttrString = NSMutableAttributedString(string: AlertMessageConstant.APP_ALERT_TITLE, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont)
        
        let alertViewController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        alertViewController.setValue(titleAttrString, forKey: "attributedTitle")
        alertViewController.setValue(messageAttrString, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: completionHandler)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
       
        let oktitleAttrString = NSMutableAttributedString(string: buttonTitle, attributes: btnTitleFont)
        let cancelAttrString = NSMutableAttributedString(string: cancelButtonTitle, attributes: btnTitleFont)
        
        //okAction.setValue(oktitleAttrString, forKey: "titleAttributedText")
       //cancelAction.setValue(cancelAttrString, forKey: "attributedTitle")
        
        
        okAction.setValue(UIColor(named: "Token_Green_568D3F"), forKey: "titleTextColor")
        cancelAction.setValue(UIColor(named: "Token_Gray_BDBDBD"), forKey: "titleTextColor")
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        self.present(alertViewController, animated: true, completion: nil)
        
        guard let label = (okAction.value(forKey: "__representer") as AnyObject).value(forKey: "_label") as? UILabel else {
            return
        }
        label.attributedText = oktitleAttrString
        
       
    }
    
    func showAlertWithComplitionHandlerWithCustomTitle(title:String,message:String,buttonTitle:String, cancelButtonTitle:String, completionHandler:((UIAlertAction) -> Swift.Void)?) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: completionHandler)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        self.present(alertViewController, animated: true, completion: nil)
       // UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithComplitionHandlerDestructive(message:String,buttonTitle:String, cancelButtonTitle:String, completionHandler:((UIAlertAction) -> Swift.Void)?) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .destructive, handler: completionHandler)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default, handler: nil)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithComplitionHandlerrr(message:String,buttonTitle:String, cancelButtonTitle:String, completionHandler:((UIAlertAction) -> Swift.Void)?) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: completionHandler)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: completionHandler)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertWithComplitionHandlerOk(message:String, completionHandler:((UIAlertAction) -> Swift.Void)?) {
        let alertViewController = UIAlertController(title: AlertMessageConstant.APP_ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completionHandler)
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func goToViewController(viewController:UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func backToToViewController(viewController:UIViewController) {
        self.navigationController?.popToViewController(viewController, animated: true)
    }
    
    func backViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func backToViewController(viewController:UIViewController) {
        
        if !(self.navigationController?.viewControllers.contains(viewController))!
        {
            self.navigationController?.pushViewController(viewController, animated: true)
        }else
        {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setRootViewController(viewController:UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = nav
    }
    
    func getUnixTimestamp() -> TimeInterval
    {
        let timestamp = NSDate().timeIntervalSince1970
        return timestamp
    }
    
    
    func getCurrentDateString() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    func getCurrentDate() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    func debugLogPrint(object: Any) {
        #if DEBUG
        print(object)
        #endif
    }
    
    
    func getDirectoryPath() -> String {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Vibe")
        ///let url = NSURL(string: path)
        return path
    }
    
    func getImagePathURLFromDirectory() -> URL {
        let path = getDirectoryPath()
        let url = NSURL(string: path)
        // let imagePath = url!.appendingPathComponent("\(imageName).jpg")?.absoluteString
        return url! as URL
    }
    
    func getImagePathFromDirectory(imageName: String) -> String {
        let path = getDirectoryPath()
        ///let url = NSURL(string: path)
        let name = imageName.replacingOccurrences(of: " ", with: "")
        let imagePath = path.appending("/\(name)")
        return imagePath
    }
    
    func saveImageDocumentDirectory(image: UIImage, imageName: String) -> String {
        let fileManager = FileManager.default
        let path = getDirectoryPath()
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let name = imageName.replacingOccurrences(of: " ", with: "")
        let urlString: String = getImagePathFromDirectory(imageName: name)
        let imageData = image.jpegData(compressionQuality: 0.5)
        //let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: urlString, contents: imageData, attributes: nil)
        return urlString
    }
    
    func getImageFromDocumentDirectory(imageName: String)  -> UIImage {
        let urlString: String = getImagePathFromDirectory(imageName: imageName)
        let image = UIImage(contentsOfFile: urlString)
        return image!
    }
    
    func getImageURLFromDocumentDirectory(imageUrl: String)  -> UIImage {
        //let urlString: String = getImagePathFromDirectory(imageName: imageName).absoluteString
        let image = UIImage(contentsOfFile: imageUrl)
        return image!
    }
    
    func deleteImageFromDirectory(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = getImagePathFromDirectory(imageName: imageName)
        if fileManager.fileExists(atPath: imagePath) {
            try! fileManager.removeItem(atPath: imagePath)
        }
       /* let yourProjectDirectoryPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProject")
        if fileManager.fileExists(atPath: yourProjectDirectoryPath) {
            try! fileManager.removeItem(atPath: yourProjectDirectoryPath)
        }*/
    }
    
    func getCurrentAppointmentName() -> String {
        //let currentAppointName = UserDefaults.getValueForKey(key: Constant.CURRENT_APPOINTMENT_NAME)
        //return currentAppointName as! String
        return ""
    }
    
    func gradientLayerWithColors(frame:CGRect ,colorSet:[CGColor], isLocation:Bool, startPoint:CGPoint, endPoint:CGPoint) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        
        if isLocation{
            var location = [NSNumber]()
            
            for (index,_) in colorSet.enumerated() {
                var intValue = index
                if index == colorSet.count-1
                {
                    intValue = colorSet.count
                }
                
                let num : Double = (Double(intValue) / Double(colorSet.count))
                print(num)
                location.append(NSNumber(value: num))
            }
            gradientLayer.locations = location
        }
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        //gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        return gradientLayer
    }

    
    func getMimeType(path:String) -> String {
        
        let mimeTypes = [
            "html": "text/html",
            "htm": "text/html",
            "shtml": "text/html",
            "css": "text/css",
            "xml": "text/xml",
            "gif": "image/gif",
            "jpeg": "image/jpeg",
            "jpg": "image/jpeg",
            "js": "application/javascript",
            "atom": "application/atom+xml",
            "rss": "application/rss+xml",
            "mml": "text/mathml",
            "txt": "text/plain",
            "jad": "text/vnd.sun.j2me.app-descriptor",
            "wml": "text/vnd.wap.wml",
            "htc": "text/x-component",
            "png": "image/png",
            "tif": "image/tiff",
            "tiff": "image/tiff",
            "wbmp": "image/vnd.wap.wbmp",
            "ico": "image/x-icon",
            "jng": "image/x-jng",
            "bmp": "image/x-ms-bmp",
            "svg": "image/svg+xml",
            "svgz": "image/svg+xml",
            "webp": "image/webp",
            "woff": "application/font-woff",
            "jar": "application/java-archive",
            "war": "application/java-archive",
            "ear": "application/java-archive",
            "json": "application/json",
            "hqx": "application/mac-binhex40",
            "doc": "application/msword",
            "pdf": "application/pdf",
            "ps": "application/postscript",
            "eps": "application/postscript",
            "ai": "application/postscript",
            "rtf": "application/rtf",
            "m3u8": "application/vnd.apple.mpegurl",
            "xls": "application/vnd.ms-excel",
            "eot": "application/vnd.ms-fontobject",
            "ppt": "application/vnd.ms-powerpoint",
            "wmlc": "application/vnd.wap.wmlc",
            "kml": "application/vnd.google-earth.kml+xml",
            "kmz": "application/vnd.google-earth.kmz",
            "7z": "application/x-7z-compressed",
            "cco": "application/x-cocoa",
            "jardiff": "application/x-java-archive-diff",
            "jnlp": "application/x-java-jnlp-file",
            "run": "application/x-makeself",
            "pl": "application/x-perl",
            "pm": "application/x-perl",
            "prc": "application/x-pilot",
            "pdb": "application/x-pilot",
            "rar": "application/x-rar-compressed",
            "rpm": "application/x-redhat-package-manager",
            "sea": "application/x-sea",
            "swf": "application/x-shockwave-flash",
            "sit": "application/x-stuffit",
            "tcl": "application/x-tcl",
            "tk": "application/x-tcl",
            "der": "application/x-x509-ca-cert",
            "pem": "application/x-x509-ca-cert",
            "crt": "application/x-x509-ca-cert",
            "xpi": "application/x-xpinstall",
            "xhtml": "application/xhtml+xml",
            "xspf": "application/xspf+xml",
            "zip": "application/zip",
            "bin": "application/octet-stream",
            "exe": "application/octet-stream",
            "dll": "application/octet-stream",
            "deb": "application/octet-stream",
            "dmg": "application/octet-stream",
            "iso": "application/octet-stream",
            "img": "application/octet-stream",
            "msi": "application/octet-stream",
            "msp": "application/octet-stream",
            "msm": "application/octet-stream",
            "docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "pptx": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
            "mid": "audio/midi",
            "midi": "audio/midi",
            "kar": "audio/midi",
            "mp3": "audio/mpeg",
            "ogg": "audio/ogg",
            "m4a": "audio/x-m4a",
            "ra": "audio/x-realaudio",
            "3gpp": "video/3gpp",
            "3gp": "video/3gpp",
            "ts": "video/mp2t",
            "mp4": "video/mp4",
            "mpeg": "video/mpeg",
            "mpg": "video/mpeg",
            "mov": "video/quicktime",
            "webm": "video/webm",
            "flv": "video/x-flv",
            "m4v": "video/x-m4v",
            "mng": "video/x-mng",
            "asx": "video/x-ms-asf",
            "asf": "video/x-ms-asf",
            "wmv": "video/x-ms-wmv",
            "avi": "video/x-msvideo"
        ]
        
        let urlPath = URL(string: path)
        let ext = urlPath?.pathExtension
        
        return mimeTypes[ext!.lowercased()]!
        
    }
    
    func randomStringWithLength (len : Int) -> String {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        let randomString : NSMutableString = NSMutableString(capacity: len)

        for _ in 0 ..< len {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }

        return randomString as String
    }
    
    func saveImageToLocal(image:UIImage, fileName:String) -> URL? {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("\(fileName).jpg")
            
            let fileManager = FileManager.default
            
            // Check if file exists
            if fileManager.fileExists(atPath: fileURL.absoluteString) {
                // Delete file
                try fileManager.removeItem(at: fileURL)
            } else {
                print("File does not exist")
            }
            if let pngImageData = image.jpegData(compressionQuality: 1) {
                try pngImageData.write(to: fileURL, options: .atomic)
                return fileURL
            }
        } catch {
            print("Image Saving Error")
        }
        return nil
    }
    
    func getImageFromLocal(fileName:String) -> UIImage? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent("\(fileName).jpg").path
        if FileManager.default.fileExists(atPath: filePath) {
            return UIImage(contentsOfFile: filePath)
        }
        return nil
    }
    
    func getDefaultJobTitle(jobType:Int) -> String {
         var value = ""
         
         switch jobType {
         case 1:
            value = "Court Call Coverage"
             break
         case 2:
            value = "Discovery Assistance"
             break
         case 3:
            value = "Legal Research"
             break
         case 4:
            value = "Legal Drafting"
             break
         case 5:
            value = "Document Review"
             break
         default:
             break
         }
         return value
     }
 
   /* func showViewController(viewController:UIViewController) -> Void {
            let centerNavVC = UINavigationController(rootViewController: viewController)
            centerNavVC.isNavigationBarHidden = true
            panel!.configs.changeCenterPanelAnimated = false
            panel!.center(centerNavVC)
        }
        

        func setRootViewControllerWithSideMenu(viewController:UIViewController)  {
            let centerNavVC = UINavigationController(rootViewController:viewController)
            centerNavVC.isNavigationBarHidden = true
            var rootController: FAPanelController!
            if #available(iOS 13.0, *) {
                rootController = (sceneDelegate?.window?.rootViewController as! FAPanelController)
            } else {
                // Fallback on earlier versions
                rootController = (appDelegate.window?.rootViewController as! FAPanelController)
            }
            rootController.configs.canLeftSwipe = false
            rootController.configs.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
            rootController.leftPanelPosition = .front
            rootController.configs.changeCenterPanelAnimated = false
            rootController.center(centerNavVC).left(appControllerManger.sideMenuViewController)
            
        }
    
    func openSideMenu()  {
        panel!.openLeft(animated: true)
    }
    
    func closeSideMenu()  {
        panel!.closeLeft()
    }*/
    
    func setOneToOneChatNode(uid1: Int , uid2: Int) -> String {
        //Check if user1’s id is less than user2's
        if(uid1 < uid2){
            return "\(uid1)_\(uid2)";
        }
        else{
            return "\(uid2)_\(uid1)";
        }
    }
    
}


//MARK:- NSNumber Extension
extension NSNumber
{
    func getTimeIntervalFromNSNumber() -> TimeInterval
    {
        let timeInterval = TimeInterval(self.doubleValue)
        return timeInterval
    }
}

//MARK:- TimeInterval Extension
extension TimeInterval
{
    func getNSNumberFromTimeInterval() -> NSNumber
    {
        let number = NSNumber(value: self)
        return number
    }
    
    func getDateStringWithFormateFromTimestamp() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    func getDateStringWithCheckInsFormateFromTimestamp() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
      
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        
        dateFormatter.dateFormat = "h:mm a"
        let timeString = dateFormatter.string(from: date as Date)
        
        let finalString = "\(dateString) at \(timeString)"
        
        return finalString
    }
    
    func getTimeStringWithFormateFromTimestamp() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    func getDateStringFromTimestamp() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    func getDateFromTimestamp() -> Date {
        let date = NSDate(timeIntervalSince1970: self)
        return date as Date
    }
}

//MARK:- String Extension
extension String {
    
    func md5() -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate()
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }
    
    func sha256() -> String{
            if let stringData = self.data(using: String.Encoding.utf8) {
                return hexStringFromData(input: digest(input: stringData as NSData))
            }
            return ""
        }

        private func digest(input : NSData) -> NSData {
            let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
            var hash = [UInt8](repeating: 0, count: digestLength)
            CC_SHA256(input.bytes, UInt32(input.length), &hash)
            return NSData(bytes: hash, length: digestLength)
        }

        private  func hexStringFromData(input: NSData) -> String {
            var bytes = [UInt8](repeating: 0, count: input.length)
            input.getBytes(&bytes, length: input.length)

            var hexString = ""
            for byte in bytes {
                hexString += String(format:"%02x", UInt8(byte))
            }

            return hexString
        }
    
    func dateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        let selectedDate = self.replaceString(string: "-", with: "/")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from:selectedDate)
        print("datedate...",date,selectedDate)
        return date
    }
    
    func replaceString(string:String, with replacetring:String) -> String {
        return self.replacingOccurrences(of: string, with: replacetring)
    }
    
    func removeString(afterString:String) -> String {
       /* if let dotRange = self.range(of: afterString) {
           self.removeSubrange(dotRange.lowerBound..<self.endIndex)
        }*/
        if let index = (self.range(of: afterString)?.lowerBound)
        {
          //prints "=value"
          String(self.suffix(from: index))

          //prints "element"
          return String(self.prefix(upTo: index))
        }
        return self
    }

    
    
    //MARK:- Validation Methods
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    func isValidPassword() -> Bool {
        //https://www.mkyong.com/regular-expressions/how-to-validate-password-with-regular-expression/
        
        /*
         Minimum eight characters, at least one letter and one number:

         "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
         Minimum eight characters, at least one letter, one number and one special character:

         "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
         Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:

         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
         Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:

         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
         Minimum eight and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character:

         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$"
         */
        
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: self)
        return result
    }
    
    func isValidMobileNumber() -> Bool {
        let string = self.replacingOccurrences(of: "-", with: "")
        let PHONE_REGEX = "^[0-9]{10,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: string)
        return result
    }
    
    func isValidCardNumber() -> Bool {
        let string = self.replacingOccurrences(of: " ", with: "")
        let PHONE_REGEX = "^[0-9]{16,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: string)
        return result
    }
    
    func isValidZipCode() -> Bool {
           let string = self.replacingOccurrences(of: " ", with: "")
           let PHONE_REGEX = "^[0-9]{5,5}$"
           let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
           let result =  phoneTest.evaluate(with: string)
           return result
       }
    
    func isValidUsername() -> Bool {
           /*let string = self.replacingOccurrences(of: " ", with: "")
           let PHONE_REGEX = "^[^a-zA-Z0-9]{20,20}$"
           let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
           let result =  phoneTest.evaluate(with: string)
           return result*/
        
        if self.count > 7 {
            return true
        }
        return false
       }
    
    func isValidRoutingNumber() -> Bool {
        let string = self.replacingOccurrences(of: " ", with: "")
        let PHONE_REGEX = "^[0-9]{9,9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: string)
        return result
    }
    
    func isValidAccountNumber() -> Bool {
        let string = self.replacingOccurrences(of: " ", with: "")
        let PHONE_REGEX = "^[0-9]{10,12}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: string)
        return result
    }
    
    func isValidUrl() -> Bool {
        
        if self == self {
            if let url = URL(string: self) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
    
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
        
    }
    
    func isAlphanumericRegularExpression() -> Bool {
        return self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    /*func md5() -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate()
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }*/
    
    /*func validateNullValue() -> String {
        if self.isEmpty || self == Constant.NULL_STRING || self == Constant.PLACEHOLDER_ADDRESS || self == Constant.PLACEHOLDER_POST_DESCRIPTION || self == Constant.PLACEHOLDER_PREFERED_BARS || self == Constant.PLACEHOLDER_PREFERED_EATS {
            return ""
        }
        return self
    }*/
    
    func validateTextEmptySoSetNull() -> String {
        /*if self.isEmpty || self == Constant.TITLE_QUESTION_OR_COMMENT {
            return Constant.NULL_STRING
        }*/
        return self
    }
    
    func getTimeIn12HoursFromate() -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        inFormatter.dateFormat = "HH:mm"

        let outFormatter = DateFormatter()
        outFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        outFormatter.dateFormat = "hh:mm a"

        let inStr = self
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        return outStr
    }
    

    var phoneFormatted: String {
            let count = self.count
            return self.enumerated().map { $0.offset % 3 == 0 && $0.offset != 0 && $0.offset != count-1 || $0.offset == count-4 && count % 4 != 0 ? "-\($0.element)" : "\($0.element)" }.joined()
        }

    var getPhoneNumberString: String {
        return self.components(separatedBy: .whitespacesAndNewlines).joined().replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
    }
    
    func binaryRepresentation<F: FixedWidthInteger>(of val: F) -> String {

            let binaryString = String(val, radix: 2)

            if val.leadingZeroBitCount > 0 {
                return String(repeating: "0", count: val.leadingZeroBitCount) + binaryString
            }

            return binaryString
        }
        
}

extension NSMutableAttributedString {
    
    @discardableResult func underLine(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue, .underlineColor: UIColor.darkGray, .foregroundColor: UIColor.darkGray]
        let underLine = NSMutableAttributedString(string:text, attributes: attrs)
        append(underLine)
        return self
    }
    
    @discardableResult func bold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Bicyclette-Bold", size: fontSize)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Bicyclette-Regular", size: fontSize)!]
        let normal = NSMutableAttributedString(string:text, attributes: attrs)
        append(normal)
        
        return self
    }
}

//MARK:- Int
extension Int {
    
    func getTerpenesValue(title:String) -> Bool {
        
        switch title {
        case terpenesArray[0]:
            return self & 1 == 1 ? true : false
        case terpenesArray[1]:
            return self & 2 == 2 ? true : false
        case terpenesArray[2]:
            return self & 4 == 4 ? true : false
        case terpenesArray[3]:
            return self & 8 == 8 ? true : false
        case terpenesArray[4]:
            return self & 16 == 16 ? true : false
        case terpenesArray[5]:
            return self & 32 == 32 ? true : false
        case terpenesArray[6]:
            return self & 64 == 64 ? true : false
        case terpenesArray[7]:
            return self & 128 == 128 ? true : false
        default:
            break
        }
        return false
    }
}


//MARK:- Double
extension Double {
    
    var decimalPlaces: Int {
        let decimals = String(self).split(separator: ".")[1]
        return decimals == "0" ? 0 : decimals.count
    }
    
   /* func getRoundedValue() -> Double {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let num = self
        let rounded = round(num * multiplier) / multiplier)
        return rounded
    }*/
}


//MARK:- UserDefaults Extension
extension UserDefaults
{
    //MARK:- Set Object in UserDefault
    static func setValueForKey(value:AnyObject , key:String)  {
        UserDefaults.standard.set(value, forKey:key)
        UserDefaults.standard.synchronize()
    }
    
    static func setBoolForKey(value:Bool , key:String)  {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func setDoubleValueForKey(value:Double , key:String)  {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func setFloatValueForKey(value:Float , key:String)  {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func setIntValueForKey(value:Int , key:String)  {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func setURLValueForKey(value:URL , key:String)  {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- Get Object from UserDefault
    static func getValueForKey(key:String) -> AnyObject {
        return UserDefaults.standard.value(forKeyPath: key) as AnyObject
    }
    
    static func getBoolValueForKey(key:String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func getDoubleValueForKey(key:String) -> Double {
        return UserDefaults.standard.double(forKey: key)
    }
    
    static func getFloatValueForKey(key:String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    static func getIntValueForKey(key:String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func getURLValueForKey(key:String) -> URL {
        return UserDefaults.standard.url(forKey: key)!
    }
    
    //MARK:- Synchronize Object in UserDefault
    static func sync() {
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- Remove Object from UserDefault
    static func removeUserDefaults(key:String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- Save and Get Object in UserDefaults
    
    static func saveUserDefaultArchivedObject(archivedData:Any, key:String) -> Void {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: archivedData)
        self.setValueForKey(value: encodedData as AnyObject, key: key)
        self.sync()
    }
    
    static func getUserDefaultArchivedObject(key:String) -> Any {
        let decoded = UserDefaults.standard.object(forKey: key) as? Data
        return NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as Any
    }
    
    
}

//MARK:- Color
extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(cgColor: UIColor.gray.cgColor)
            return
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        b = CGFloat(rgbValue & 0x0000FF) / 255.0
        a = CGFloat(1.0)
        
        self.init(red: r, green: g, blue: b, alpha: a)
        return
    }
}

extension UIImage
{
    
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func resizeImageRectangle(targetSize: CGSize) -> CGRect {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return rect
    }
}


//MARK:- UILabel
extension UILabel {

    var isLabelTruncated: Bool {

        guard let labelText = text else {
            return false
        }

        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font!],
            context: nil).size
        
        return labelTextSize.height < bounds.size.height
    }
}

//MARK:- Date

extension Date {
    
    func getStringFromDateInDDMMYYYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func getTimeStringFromDateInTIME_AM_PM() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let dateString = dateFormatter.string(from: self)
        return dateString
        
        
    }
    
    func getDate21YearAgo(previousYearRange:Int) -> [Int] {
        
        let date = Calendar.current.date(byAdding: .year, value: previousYearRange , to: self)
        let dateDayFormatter = DateFormatter()
        dateDayFormatter.dateFormat = "dd"
        let dateDayString = dateDayFormatter.string(from: date!)
        
        
        let dateMonthFormatter = DateFormatter()
        dateMonthFormatter.dateFormat = "MM"
        let dateMonthString = dateMonthFormatter.string(from:date!)
        
        let dateYearFormatter = DateFormatter()
        dateYearFormatter.dateFormat = "yyyy"
        let dateYearString = dateYearFormatter.string(from:date!)
        
        return [Int(dateDayString)!, Int(dateMonthString)!, Int(dateYearString)!]
    }
    
    /*func getCurrentDateString() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }*/
    
}


//MARK:- UITableView
extension UITableView {

    func setEmptyMessage(_ message: String, height:CGFloat) {
        let messageLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.bounds.size.width-40, height: height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Bicyclette-Regular", size: 16)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        //self.separatorStyle = .singleLine
    }
}
/*
 /*// Decimal to binary
 let d1 = 5
 let b1 = String(d1, radix: 2)
 let string = b1.count < 5 ? 5 - b1.count : 0
 var fString = b1
 for _ in 1...string {
     fString = "0"+fStringmk }
 print(fString) // "10101"
 */
 
/* // Binary to decimal
 let b2 = "00110"
 let d2 = Int(b2, radix: 2)!
 print(d2) // 22*/
 */
