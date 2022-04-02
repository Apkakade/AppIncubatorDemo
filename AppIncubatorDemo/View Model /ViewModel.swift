//
//  ViewModel.swift
//  mvvm_demo
//
//  Created by Komal Barde on 13/04/20.
//  Copyright © 2020 madhuri. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class UserApiManager{
    weak var vc : ViewController?
    var MainJson : ImagesModelStructs!
    var ImagesArray = [ImageListTblData]()
    
    func getImagesFromJsonFile(){
        let path = Bundle.main.path(forResource: "ImageDataJsonFile", ofType: "json")!
        let url = URL(fileURLWithPath: path)

        do {

            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            let decoder = JSONDecoder()
            MainJson = try decoder.decode(ImagesModelStructs.self, from: data)
            if langCode == 0
            {
                ImagesArray = MainJson.EnglishData
             }else{
                 ImagesArray = MainJson.HindiData
             }
            DispatchQueue.main.async {
              self.vc?.tblViewImg.reloadData()
            }
            print(json)
            
        } catch {
            print(error)
        }
        }
    
}
