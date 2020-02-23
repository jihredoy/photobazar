//
//  registervc.swift
//  photobazar
//
//  Created by eitysams on 2/9/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class registervc: UIViewController ,UITextFieldDelegate {
    
    //Outlets
    
    
    @IBOutlet weak var usernametxt: UITextField!
    
    
    @IBOutlet weak var emailtxt: UITextField!
    
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    @IBOutlet weak var confirmpasstxt: UITextField!
    
    
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var passwordcheckImg: UIImageView!
    
    
    @IBOutlet weak var confirmpasscheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordtxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        confirmpasstxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    @objc func textFieldDidChange( textField : UITextField){
        guard let passTxt = passwordtxt.text else {return}
        //if we have started typing int he confirm pass text field.

        if textField == confirmpasstxt {
            passwordcheckImg.isHidden = false
            confirmpasscheckImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                passwordcheckImg.isHidden = false
                confirmpasscheckImg.isHidden = false
//                confirmpasstxt.text = ""
            }
        }

       //make it so when the passwords match the checkmarks turn green.
        if passwordtxt.text == confirmpasstxt.text {
            passwordcheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmpasscheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else { passwordcheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmpasscheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }

    
    @IBAction func registerclicked(_ sender: Any) {

    
    guard let email = emailtxt.text, email.isNotEmpty ,
          let username = usernametxt.text , username.isNotEmpty ,
          let password = passwordtxt.text, password.isNotEmpty else {
            simpleAlert(title: "error", msg: "please fill out all fields.")
            return
            }
        guard let confirmpass = confirmpasstxt.text , confirmpass == password else {
            simpleAlert(title: "error", msg: "passwords do not match.")
            return
        }
        
        activityindicator.startAnimating()
        guard  let authUser = Auth.auth().currentUser else {
            
            return
        }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        
        
        
        
        
        authUser.link(with: credential) { (result, error) in
            
            if let error = error {
                debugPrint(error)
               Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            self.activityindicator.stopAnimating()
            print("successfully registered new user")
            self.dismiss(animated: true, completion: nil)
       }
   }
}
