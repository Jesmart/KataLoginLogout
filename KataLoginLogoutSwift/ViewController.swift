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
    var presenter: KataPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = KataPresenter(view: self, kataApp: kataApp)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let user = userTextfield.text ?? ""
        let pass = passTextfield.text ?? ""

        presenter.didTapLoginButton(user: user, password: pass)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        
        presenter.didTapLogoutButton()
    }
}

extension ViewController: View {
    
    func showError(title: String) {
        
        let alert = UIAlertController(title: "Status", message: title, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showLoginForm() {
        
        userTextfield.text = ""
        passTextfield.text = ""
        
        userTextfield.isHidden = false
        passTextfield.isHidden = false
        loginButton.isHidden = false
    }
    
    func hideLoginForm() {
        
        userTextfield.isHidden = true
        passTextfield.isHidden = true
        loginButton.isHidden = true
    }
    
    func showLogoutForm() {
        
        logoutButton.isHidden = false
    }
    
    func hideLogoutForm() {
        
        logoutButton.isHidden = true
    }
}
