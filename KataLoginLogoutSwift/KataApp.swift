//
//  KataApp.swift
//  KataLoginLogoutSwift
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import Foundation

class KataApp {
    
    private let clock: Clock
    
    init(clock: Clock) {
        self.clock = clock
    }
    
    func validate(user: String, password: String) -> Bool {
        
        return user == "admin" && password == "admin"
    }
    
    func validLogout() -> Bool {

        return Int(clock.now.timeIntervalSince1970) % 2 == 0
    }
    
}

class Clock {
    
    var now: Date {
        return Date()
    }
}
