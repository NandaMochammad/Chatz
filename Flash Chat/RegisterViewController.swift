//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        emailTextfield.isEnabled = false
        passwordTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
            if(self.emailTextfield.text?.isEmpty)! ||
                (self.passwordTextfield.text?.isEmpty)!
            {
                print("All fields are required to fill in")
                SVProgressHUD.dismiss()
                
                self.emailTextfield.isEnabled = true
                self.passwordTextfield.isEnabled = true
                self.sendButton.isEnabled = true
            }
            else{
                if error != nil{
                    print(error!)
                }else{
                print("Registration Success")
                    
                    SVProgressHUD.dismiss()
                    
                    self.emailTextfield.isEnabled = true
                    self.passwordTextfield.isEnabled = true
                    self.sendButton.isEnabled = true
                    
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        } 

        
        
    } 
    
    
}
