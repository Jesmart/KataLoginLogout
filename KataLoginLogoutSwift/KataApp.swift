//
//  KataApp.swift
//  KataLoginLogoutSwift
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import Foundation

class KataApp {
    
    func validate(user: String, password: String) -> Bool {
        
        return user == "admin" && password == "admin"
    }
    
}
