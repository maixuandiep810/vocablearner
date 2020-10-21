//
//  ViewController.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnAction(_ sender: Any) {
        BaseClient.shared.loginWithUrl(username: "user1", password: "123") { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                print(value)
            } else {
                // Show message login fail
            }
        }
    }
    
}

