//
//  CommonExtension.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/25/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func initController(id: String) -> UIViewController {
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
    func resetRoot(id: String) {
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? UIViewController
        else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
//    func setNavigationBarLogo(title: String, controlEvents control :UIControl.Event, ForAction action:@escaping () -> Void) {
//
//        // Logo in center
////        let logo = UIImage(named: Resources.kHomeMovieLogo)
////        let imageView = UIImageView(image: logo)
////        imageView.contentMode = .scaleAspectFill
////        self.navigationItem.titleView = imageView
//
////        let logoImage = UIImage.init(named: Resources.kHomeMovieLogo)
////        let logoImageView = UIImageView.init(image: logoImage)
////        logoImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
////        logoImageView.contentMode = .scaleAspectFit
//
//        // Title in left
//        let titleFrame = CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.width)!/2, height: (self.navigationController?.navigationBar.frame.height)!)
//        let labelTitle = UILabel(frame: titleFrame)
//        labelTitle.textColor = .white
//        labelTitle.text = title.uppercased()
//        labelTitle.font = UIFont.boldSystemFont(ofSize: 18)
//        let imageItem = UIBarButtonItem.init(customView: labelTitle)
//        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        negativeSpacer.width = -25
//        navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
//
//        // Search in right
//        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
//        button.setImage(UIImage.init(named: Resources.kSearchLogo), for: .normal)
//        button.actionHandler(controlEvents: control, ForAction: action)
//        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//
//        let barButton = UIBarButtonItem(customView: button)
//        navigationItem.rightBarButtonItem = barButton
//
//    }
//}
//
//extension UIButton {
//    private func actionHandler(action:(() -> Void)? = nil) {
//        struct __ { static var action :(() -> Void)? }
//        if action != nil { __.action = action }
//        else { __.action?() }
//    }
//    @objc private func triggerActionHandler() {
//        self.actionHandler()
//    }
//    func actionHandler(controlEvents control :UIControl.Event, ForAction action:@escaping () -> Void) {
//        self.actionHandler(action: action)
//        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
//    }





}
