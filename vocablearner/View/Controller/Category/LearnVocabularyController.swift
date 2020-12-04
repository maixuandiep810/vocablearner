//
//  LearnVocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/30/20.
//

import UIKit
import RealmSwift
import AVFoundation



//class LearnVocabularyController: UIViewController {
//    var listVocabularyModel = List<VocabularyModel>()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}




class LearnVocabularyController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var vocabularyClt: UICollectionView!
    var categoryModel = CategoryModel()
    var listVocabularyModel = List<VocabularyModel>()
    var currentIndex = 0
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordingSession = AVAudioSession.sharedInstance()
        do {
            //            let url = NSURL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3") as! URL
            //            try audioPlayer = AVAudioPlayer.
            //            audioPlayer?.delegate = self
            //            audioPlayer?.prepareToPlay()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
        configUIWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gotoCurrentCellSelected(animated: true)
    }
    
    
    // MARK: Outlet Actions
    
    @IBAction func AudioButtonTouchUpInside(_ sender: Any) {
        print("AAAAA")
        self.audioPlayer?.play()
        
    }
    
    @IBAction func CheckAudioButtonTouchUpInside(_ sender: Any) {
        print("BBBB")
        let checkAudioButton: UIButton! = sender as! UIButton
        if recordingSession.recordPermission != .granted {
            requestRecordPermission()
            return
        }
        if audioRecorder == nil {
            startRecording(checkAudioButton: checkAudioButton)
        } else {
            finishRecording(checkAudioButton: checkAudioButton, success: true)
        }
    }
}







extension LearnVocabularyController {
    
    
    
    
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case self.listVocabularyModel.count:
            let cell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.LearnVocabularyCellID, for: indexPath)
            return cell
        default:
            let cell: LearnVocabularyCell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.LearnVocabularyCellID, for: indexPath) as! LearnVocabularyCell
            cell.resetData()
            cell.data = self.listVocabularyModel[indexPath.row]
            return cell
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.currentIndex = (self.currentIndex == self.listVocabularyModel.count - 1) && (self.vocabularyClt.scrollDirection == .right) ? (-1) : (self.currentIndex)
        let scrollDirection = self.vocabularyClt.scrollDirection
        self.vocabularyClt.isScrollEnabled = false
        self.vocabularyClt.isScrollEnabled = true
        self.currentIndex = (scrollDirection == .right) ? (self.currentIndex + 1) : (self.currentIndex - 1)
        let nextIndexPath = IndexPath(indexes: [0, self.currentIndex])
        self.vocabularyClt.scrollToItem(at: nextIndexPath, at: self.vocabularyClt.scrollDirectionExt, animated: true)
    }
    
    
    
    
    
    
    
    
    // MARK: ConfigUI
    
    func configUI() -> Void {
    }
    
    
    
    func configUIWillAppear() -> Void {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Detail", style: .plain, target: self, action: #selector(detailTapped))
    }
    
    
    
    
    // MARK: Target Actions
    
    @objc func detailTapped() -> Void {
        
    }
    
    
    
    
    
    
    
    // MARK: Private Methods
    func gotoCurrentCellSelected(animated: Bool) -> Void {
        let nextIndexPath = IndexPath(indexes: [0, self.currentIndex])
        self.vocabularyClt.scrollToItem(at: nextIndexPath, at: .right, animated: animated)
    }
    
    func requestRecordPermission() -> Void {
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                    } else {
                    }
                }
            }
        } catch {
            print("Error info: \(error)")        }
    }
    
    
    func startRecording(checkAudioButton: UIButton!) {
        
        let currentIndexPath = IndexPath(indexes: [0, self.currentIndex])
        let currentLearnVocabularyCell: LearnVocabularyCell! = self.vocabularyClt.cellForItem(at: currentIndexPath) as! LearnVocabularyCell
        currentLearnVocabularyCell.vocabularyTable.isScrollEnabled = false
        if let image = UIImage(named: "finish_record.png") {
            checkAudioButton.setImage(image, for: .normal)
        }
        let audioFilename = DocumentManager.shared.getDocumentsDirectory().appendingPathComponent(DocumentUrl.defaultAudioUrl)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            finishRecording(checkAudioButton: checkAudioButton, success: false)
        }
    }
    
    func finishRecording(checkAudioButton: UIButton!, success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if let image = UIImage(named: "start_record.png") {
            checkAudioButton.setImage(image, for: .normal)
        }
        
        if success {
            BaseClient.shared.checkPronunciation(vocabularyId: "1")
            { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                } else {
                    let alert = UIAlertController(title: "Successed", message: "Successed.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "Failed", message: "Failed.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully
                                        flag: Bool) {
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer,
                                        error: Error?) {
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
    }
    
    
    func finishTest(addFinishRequest: AddFinishRequest) {
        BaseClient.shared.addFinishTestByUrl (addFinishRequest: addFinishRequest,
                                              completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                                                if(isSuccess!) {
                                                    self.gotoCategoryController()
                                                }
                                              }
                                              
        )
    }
    
    func gotoCategoryController() -> Void {
        
        let controller = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(controller, animated: true)    }
}




// BIN

//        self.currentIndex = Int(self.pageStepper.value)
//        let nextIndexPath = self.vocabularyClt.indexPathsForVisibleItems[0]
//        var indexPathList: [IndexPath] = []
