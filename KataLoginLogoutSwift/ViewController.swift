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
    
    let kataApp = KataApp()
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let user = userTextfield.text, let pass = passTextfield.text else {
            return
        }
        
        if  kataApp.validate(user: user, password: pass) {
            
            let hola = UIAlertController(title: "Login", message: "Success", preferredStyle: .alert)
            present(hola, animated: true, completion: nil)
        }
    }
}

