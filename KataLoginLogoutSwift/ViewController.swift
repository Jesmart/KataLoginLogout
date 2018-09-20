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
    
    @IBAction func loginAction(_ sender: Any) {
        
        if userTextfield.text == "admin" && passTextfield.text == "admin" {
            
            let hola = UIAlertController(title: "Login", message: "Success", preferredStyle: .alert)
            present(hola, animated: true, completion: nil)
            
        }
        
    }
    
}

