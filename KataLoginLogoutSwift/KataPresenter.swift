//
//  KataPresenter.swift
//  KataLoginLogoutSwift
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import Foundation

protocol View {
    func showError(title: String)
    func showLoginForm()
    func hideLoginForm()
    func showLogoutForm()
    func hideLogoutForm()
}

class KataPresenter {
    
    let view: View
    let kataApp: KataApp
    
    init(view: View, kataApp: KataApp) {
        self.view = view
        self.kataApp = kataApp
    }
    
    func didTapLoginButton(user: String, password: String) {
        
        if kataApp.validate(user: user) {
            
            if  kataApp.validate(user: user, password: password) {
                
                view.hideLoginForm()
                view.showLogoutForm()
            } else {
                
                view.showError(title: "Invalid credentials")
            }
            
        } else {
            
            view.showError(title: "Invalid user")
        }
    }
    
    func didTapLogoutButton() {
        
        if kataApp.validLogout() {
            
            view.hideLogoutForm()
            view.showLoginForm()
        } else {
            view.showError(title: "Logout error")
        }
    }
}
