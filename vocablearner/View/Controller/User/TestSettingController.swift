//
//  UserSettingController.swift
//  vocablearner
//
//  Created by Rocky on 11/25/20.
//

import UIKit
import RealmSwift

class TestSettingController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var testSettingTBL: UITableView!
    var listCell: [TestSettingCell]?
    var listTestSetting: List<TestSettingModel>?
    
    
    // MARK: Life-Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        loadTestSetting(userId: String(CurrentUser.shared.user!.id))
        configUINavigationBar()
    }
}



extension TestSettingController {
    
    
    // MARK: UITableViewDataSource, UITableViewDelagate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TestSettingCell = self.testSettingTBL.dequeueReusableCell(withIdentifier: StoryboardId.TestSettingCellID, for: indexPath) as! TestSettingCell
        cell.parentController = self
        cell.data = self.listTestSetting?[indexPath.row]
        listCell?.append(cell)
        return cell
    }
    
    
    
    // MARK: Private Methods
    
    
    func loadTestSetting(userId: String) {
        
        BaseClient.shared.getTestSetting(userId: userId,
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listTestSetting = value as? List<TestSettingModel>
                    self.testSettingTBL.reloadData()
                }
            }
            
        )
    }
}
