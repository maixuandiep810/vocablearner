//
//  TestSettingCell.swift
//  vocablearner
//
//  Created by Rocky on 11/25/20.
//

import UIKit

class TestSettingCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var levelLB: UILabel!
    @IBOutlet weak var topicDayTF: UITextField!
    @IBOutlet weak var timeLB: UILabel!
    var dayPK: UIPickerView?
    var parentController: UserSettingController?
    
    var data: TestSettingModel? {
        didSet {
            guard let data = data else {
                return
            }
            didSetData(data: data)
            configUI()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func didSetData(data: TestSettingModel) -> Void {
        levelLB.text = data.Name
        topicDayTF.text = String(data.Value)
        timeLB.text = String(data.Time)
    }
    
    // MARK: UIPickerViewDelegate, UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TopicDayOptions.pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(TopicDayOptions.pickerData[row] )
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.topicDayTF.text = String(TopicDayOptions.pickerData[row])
    }
    
    func configUI() -> Void {
        guard let parentController = parentController else {
            return
        }
        self.dayPK = UIPickerView(frame:CGRect(x: 0, y: 0, width: parentController.view.frame.size.width, height: 216))
        self.dayPK!.delegate = self
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dayPKDone))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.dayPKCancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.topicDayTF.inputView = self.dayPK!
        self.topicDayTF.inputAccessoryView = toolBar
        self.topicDayTF.text = String(TopicDayOptions.pickerData[0])
    }
    
    
    // MARK: Target Action
    
    @objc func dayPKDone() -> Void {
        self.topicDayTF.resignFirstResponder()
//        let topicDayTF = self.topicDayTF.text
////        let levelId = String(LevelOptions.pickerId[levelTFText!]!)
////        self.loadCategoryByLevel(levelId: levelId)
    }
    @objc func dayPKCancel() -> Void {
        self.topicDayTF.resignFirstResponder()
    }
    
    

}
