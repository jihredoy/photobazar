import UIKit
import  Firebase
import FirebaseAuth
class loginVC: UIViewController {
    
    
    @IBOutlet weak var emailtxt: UITextField!
    
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    
    
    @IBAction func forgatepasswordclicked(_ sender: Any) {
    }
    
    
    @IBAction func loginclicked(_ sender: Any) {
       guard let email = emailtxt.text , email.isNotEmpty ,
          let password = passwordtxt.text , password.isNotEmpty else {
            simpleAlert(title: "error", msg: "please fill out all fields.")
            
        return
            
        }
        activityindicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) {( user, error) in
            
            if let error = error {
                debugPrint(error)
                self.handleFireAuthError(error: error)
                self.activityindicator.startAnimating()
                return
            }
            self.activityindicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
}
    
    
    @IBAction func guestclicked(_ sender: Any) {
    }
}
