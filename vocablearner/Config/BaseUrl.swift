//
//  BaseUrl.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//



import Foundation

struct API {
    
    static let kBaseUrlSSL = "https://103.90.232.138:5001"
    static let kBaseUrl = "http://103.90.232.138:5000"
    static let kFileUrl = "http://103.90.232.138:5000"
    
    static let kWeatherforecastUrl = "/api/weatherforecast"

    static let kLoginUrl = "/api/user/authenticate"
    static let kLogoutUrl = "/api/user/logout"
    static let kRegisterUrl = "/api/user/register"
    static let kVocabularyUrl = "/api/vocabulary"
    static let kVocabularyByCategoryIdUrl = "/api/vocabulary/%@"
    static let kCheckPronunciationByVocabularyIdUrl = "/api/file/check_pronunciation/%@"
    static let kCategoryByQueryUrl = "/api/category/%@/%@/%@/%@"
    static let kCategoryUrl = "/api/category"
    static let kCategoryByLevelUrl = "/api/category/level/%@"
    static let kFinishTestUrl = "/api/test/finish"
    static let kTestSettingUrl = "/api/usersetting/testsetting/%@"
    
    static let kTestGetAudioUrl = "https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav"
    
    static let IsDifficultParam_ALL = "0"
}
		
struct DocumentUrl {
    
    static let defaultAudioUrl = "recording.m4a"
}

