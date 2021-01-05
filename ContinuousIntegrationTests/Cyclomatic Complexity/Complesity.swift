//
//  Complesity.swift
//  ContinuousIntegrationTests
//
//  Created by Ricardo Maqueda Martinez on 05/01/2021.
//

import Foundation
import UIKit

enum LeftGuestMenu {
    case hello
    
    init? (rawValue: Int) {
        self = LeftGuestMenu.hello
        if rawValue < 1 {
            print("Hello")
        } else {
            
            return nil
        }
    }
}

class Complesity {
    
    func selectedMenuInLoggedOutState(sender: UIButton) {
        switch sender.tag {
        case 1:
            if let menu = LeftGuestMenu(rawValue: 0) {
                print("Hello \(menu)")
            }
        case 2:
            if let menu = LeftGuestMenu(rawValue: 1) {
                print("Hello \(menu)")
            }
        case 3:
            if let menu = LeftGuestMenu(rawValue: 2) {
                print("Hello \(menu)")
            }
        case 4:
            if let menu = LeftGuestMenu(rawValue: 3) {
                print("Hello \(menu)")
            }
        case 5:
            if let menu = LeftGuestMenu(rawValue: 4) {
                print("Hello \(menu)")
            }
        case 6:
            if let menu = LeftGuestMenu(rawValue: 5) {
                print("Hello \(menu)")
            }
        default:
            break
        }
    }
    
}
