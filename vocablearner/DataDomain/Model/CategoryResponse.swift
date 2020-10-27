//
//  CategoryResponse.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import UIKit
import ObjectMapper
import RealmSwift


// VOCABULARY RESPONSE
class CategoryResponse: BaseResponse<ListCategoryModelData> {
    
}




// LIST OF CAREGORY MODEL DATA
class ListCategoryModelData: Object, Mappable {
    
    var list = List<CategoryModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        list           <- (map["List"], ListTransform<CategoryModel>())
    }
}
