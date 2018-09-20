//
//  ViewController.swift
//  KataLoginLogoutSwift
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    let kataApp = KataApp(clock: Clock())
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let user = userTextfield.text, let pass = passTextfield.text else {
            return
        }
        
        if  kataApp.validate(user: user, password: pass) {
            doLogin()
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        
        if kataApp.validLogout() {
            doLogout()
        } else {
            
            let alert = UIAlertController(title: "Logout", message: "Error", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        
        }
        
    }
    
    private func doLogin(){
        
        userTextfield.isHidden = true
        passTextfield.isHidden = true
        loginButton.isHidden = true
        logoutButton.isHidden = false
    }
    
    private func doLogout() {
        
        userTextfield.text = ""
        passTextfield.text = ""

        logoutButton.isHidden = true
        userTextfield.isHidden = false
        passTextfield.isHidden = false
        loginButton.isHidden = false
    }
    
}
