//
//  UserController.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import Alamofire
import SDWebImage

class UserController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameLb: UILabel!
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.topItem?.title = StoryboardConstVar.UserControllerNavTitle
        assignData()
        configUI()
    }

    
    // MARK: IBActions
    @IBAction func settingTouchUpInSide(_ sender: Any) {
        gotoTestSettingController()
    }
    
    
}

extension UserController {
    
    // MARK: Private Methods
    
    func configUI() -> Void {
        
        self.avatarImage.layer.masksToBounds = true
        self.avatarImage.layer.cornerRadius = 75
    }
    
    
    func assignData() -> Void {
        
        guard let user = CurrentUser.shared.user else { return }
        if(user.avatarUrl.count > 0){
            self.avatarImage.sd_setImage(with: URL(string: "\(API.kFileUrl + user.avatarUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
        }
        self.usernameLb.text = "\(user.username)"
    }
    
    
    func gotoTestSettingController() -> Void {
        let controller: UserSettingController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.UserSettingControllerID) as! UserSettingController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}








/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
