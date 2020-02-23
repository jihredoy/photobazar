//
//  Extensions.swift
//  photobazar
//
//  Created by eitysams on 2/12/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Firebase

extension String {
    var isNotEmpty : Bool{
        return !isEmpty
    }
    
    
}
extension UIViewController {
    
 func handleFireAuthError(error: Error) {
    
    if let errorCode =  AuthErrorCode(rawValue: error._code) {
    let alert = UIAlertController(title: "error", message: errorCode.errorMessage, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
    }
 }
    
    func simpleAlert( title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
}


//
//extension AuthErrorCode {
//    var errorMessage: String {
//        switch self {
//        case .emailAlreadyInUse:
//            return "The email is already in use with another account. Pick another email!"
//        case .userNotFound:
//            return "Account not found for the specified user. Please check and try again"
//        case .userDisabled:
//            return "Your account has been disabled. Please contact support."
//        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
//            return "Please enter a valid email"
//        case .networkError:
//            return "Network error. Please try again."
//        case .weakPassword:
//            return "Your password is too weak. The password must be 6 characters long or more."
//        case .wrongPassword:
//            return "Your password or email is incorrect."
//
//        default:
//            return "Sorry, something went wrong."
//        }
//    }
//    
//}
//
