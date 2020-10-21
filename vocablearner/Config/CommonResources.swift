//
//  CommonResources.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import Foundation
import UIKit


//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
//        contentMode = mode
//        DispatchQueue.global(qos: .background).async {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard
//                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                    let data = data, error == nil,
//                    let image = UIImage(data: data)
//                    else {
//                        return
//
//                }
//                DispatchQueue.main.async() { [weak self] in
//                    self?.image = image
//                    DataManager.shared.imageCache.setObject(image, forKey: url as AnyObject)
//                }
//            }.resume()
//        }
//
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//
//}

//struct Resources {
//    static let kHomeMovieLogo = "home_logo_nav"
//    static let kSearchLogo = "search_icon"
//}
