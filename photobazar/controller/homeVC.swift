//
//  ViewController.swift
//  photobazar
//
//  Created by eitysams on 2/9/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class homeVC: UIViewController {
    //outlets
    

    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { ( result, error) in
                if let error = error {
                    Auth.auth().handleFireAuthError(error: error, vc: self)
                    debugPrint(error)
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
 
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser  , !user.isAnonymous{
            // we are loged in
         loginOutBtn.title = "Logout"
            
        }else{
            loginOutBtn.title = "Login"
        }
    
    }
    fileprivate func presentLoginController() {
        let storyboard = UIStoryboard(name:Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func loginOutClicked(_ sender: Any) {
        guard let user = Auth.auth().currentUser else { return}
        if user.isAnonymous {
            presentLoginController()
        } else {
            do {
                try Auth.auth().signOut()
                Auth.auth().signInAnonymously { (result, error) in
                    if let error = error {
                        self.handleFireAuthError(error: error)
                        debugPrint(error)
                    }
                        self.presentLoginController()
                    
                }
            } catch {
                self.handleFireAuthError(error: error)
                debugPrint(error)
                
            }
        }
        
        
        }
    }

