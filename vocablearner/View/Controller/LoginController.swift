//
//  ViewController.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    
    // Mark: Properties
    
    @IBOutlet var usernameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    
    
    // Mark: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
    }
    
    
    // Mark: Helper Methods

    
    func configView() {
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    // Mark: Development ENV Functions
    func logout() {
        if EnvironmentConfig.isDevelop {
            
        }
    }


}


// Mark: Extensions - LoginController

extension LoginController {
    
    // Mark: Actions
    @IBAction func LoginBtnTouchUpInside(_ sender: Any) {
        
        BaseClient.shared.loginWithUrl(username: usernameTf.text!, password: passwordTf.text!)
        { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                 self.resetRoot(id: StoryboardId.ParentControllerID)
            } else {
                // Show message login fail
            }
        }
    }
    
    
    // MARK : UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
}
    


