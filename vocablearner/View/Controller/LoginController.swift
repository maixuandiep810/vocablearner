//
//  ViewController.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    
    // MARK: Properties
    
    @IBOutlet var usernameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    

    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
}

extension LoginController {
    
    // MARK: Actions
    @IBAction func LoginBtnTouchUpInside(_ sender: Any) {
        BaseClient.shared.loginWithUrl(username: usernameTf.text!, password: passwordTf.text!)
        { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                // TODO : check login FAIL or SUCCESS
                 self.resetRoot(id: StoryboardId.ParentControllerID)
            } else {
                let alert = UIAlertController(title: "Failed", message: "Username Or Password Incorrect", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    
    // MARK: Helper Methods
    
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
    
    // MARK: Development ENV Functions
    func logout() {
        if EnvironmentConfig.isDevelop {
        }
    }
    
}
    


