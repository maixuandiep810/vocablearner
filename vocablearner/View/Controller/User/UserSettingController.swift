//
//  UserSettingController.swift
//  vocablearner
//
//  Created by Rocky on 12/1/20.
//

import UIKit

class UserSettingController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func testSettingBTN_TUIS(_ sender: Any) {
        
        gotoTestSettingController()
    }
    
}


extension UserSettingController {
    
    
    func gotoTestSettingController() -> Void {
        
        let controller: TestSettingController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.TestSettingControllerID) as! TestSettingController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
