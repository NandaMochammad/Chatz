//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        SVProgressHUD.show()

        emailTextfield.isEnabled = false
        passwordTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        

        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if let errorGet = error {
                print("There's a problem during Login")
                print(errorGet)
                
                SVProgressHUD.dismiss()

                
                self.emailTextfield.isEnabled = true
                self.passwordTextfield.isEnabled = true
                self.sendButton.isEnabled = true
            }else{
                print("Login Success")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
                self.emailTextfield.isEnabled = true
                self.passwordTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                
            }
            
        }
        
    }
    


    
}  
