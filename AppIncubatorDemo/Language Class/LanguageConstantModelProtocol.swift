

import Foundation
protocol LanguageConstantModelProtocol {
    var appName : String{get}
    var langCode : Int{get}
    var btnName : String{get}
    var tblCellheight : Int{get}
    var clcCellheight : Int{get}
   
    }

class EnglishLanguage : LanguageConstantModelProtocol
{
    
    var langCode: Int = 0
    var appName = "AppIncubator"
    var btnName = "Change Language"
    var tblCellheight: Int = 200
    var clcCellheight: Int = 200
    
}

class HindiLanguage : LanguageConstantModelProtocol
{
        var appName = "ऐप इनक्यूबेटर"
        var langCode: Int = 1
        var btnName = "भाषा बदलें"
        var tblCellheight: Int = 200
        var clcCellheight: Int = 200
}
