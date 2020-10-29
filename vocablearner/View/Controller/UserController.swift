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
    
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameLb: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let user = CurrentUser.shared.user else { return }
        if user.avatarUrl != nil {
            self.avatarImage.sd_setImage(with: URL(string: "\(API.kFileUrl + user.avatarUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))

        }
        usernameLb.text = "\(user.username)"

    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
