//
//  ForgotPasswordVC.swift
//  photobazar
//
//  Created by eitysams on 2/20/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    //outlets
    
    @IBOutlet weak var emailtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cencleclicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetclicked(_ sender: Any) {
    }
}
