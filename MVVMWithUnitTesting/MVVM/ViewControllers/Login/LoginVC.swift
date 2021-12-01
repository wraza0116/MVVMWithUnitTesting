//
//  LoginVC.swift
//  MVVMWithUnitTesting
//
//  Created by Wasim Raza on 27/11/21.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    //MARK:- Declarations
    private var loginViewModel : LoginViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewModel = LoginViewModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressedAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3: //Login
            callToLoginInApp()
            break
        default:
            break
        }
    }

}

//MARK:- Functions
extension LoginVC {
    
    func callToLoginInApp() {
        
        
    }
    
    func updateUI() {
    }
}
