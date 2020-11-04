//
//  CommonExtension.swift
//  HomeMovie
//
//  Created by Rocky on 10/21/20.
//
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper

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

}


extension UIScrollView {
    enum ScrollDirection {
        case up
        case down
        case left
        case right
        case unknown
    }
    
    var scrollDirection: ScrollDirection {
        guard let superview = superview else { return .unknown }
        if panGestureRecognizer.translation(in: superview).y != 0 {
            return panGestureRecognizer.translation(in: superview).y > 0 ? .down : .up
        }
        else if panGestureRecognizer.translation(in: superview).x != 0 {
            return panGestureRecognizer.translation(in: superview).x < 0 ? .right : .left
        }
        return .unknown
    }
}

extension UICollectionView {
    var scrollDirectionExt: ScrollPosition {
        switch self.scrollDirection {
        case .right:
            return ScrollPosition.right
        case .left:
            return ScrollPosition.left
        case .up:
            return ScrollPosition.top
        case .down:
            return ScrollPosition.bottom
        default:
            return ScrollPosition.right
        }
    }
    
}



// BIN
//func getDestinationScroll(section: Int, cell: Int) -> IndexPath {
//    return IndexPath([section, cell])
//}
