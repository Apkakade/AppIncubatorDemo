//
//  ExcerciseList.swift
//  Met_Assignment
//
//  Created by Apple on 22/03/22.
//

import Foundation
struct ImagesModelStructs: Decodable {
    var EnglishData : [ImageListTblData]
    var HindiData : [ImageListTblData]
}

struct ImageListTblData : Decodable
{
    var ImgName : String
    var ImgData : [ImageListClcData]
}

struct ImageListClcData : Decodable
{
    var imgUrl : String
}
