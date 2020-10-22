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

                    BaseClient.shared.loginWithUrl(username: "user1",
                                                   password: "123")
                    { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                        //Loading.dismissLoading()
                        if(isSuccess!) {
                            let alert = UIAlertController(title: "My Title", message: "Login success", preferredStyle: UIAlertController.Style.alert)

                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            // Show message login fail
                            // create the alert
                        let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                        }
                    }
            }
    }
    


