//
//  ViewController.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit

class LoginController: UIViewController {

    
    // Mark: Properties
    
    @IBOutlet var usernameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    
    
    // Mark: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BaseClient.shared.getVocabularyWithUrl()
        { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                 self.resetRoot(id: StoryboardId.ParentControllerID)
            } else {
                // Show message login fail
            }
        }
        
        
    }
    
    
    // Mark: Util Methods


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
    
}
    


