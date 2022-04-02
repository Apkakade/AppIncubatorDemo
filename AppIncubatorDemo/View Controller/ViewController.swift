//
//  ViewController.swift
//  AppIncubatorDemo
//
//  Created by Apple on 01/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var viewModelUser = UserApiManager()
    @IBOutlet weak var btn_language: UIButton!
    @IBOutlet weak var lbl_appName: UILabel!
    @IBOutlet weak var tblViewImg: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViewImg.tableFooterView = UIView()
        viewModelUser.vc = self
        viewModelUser.getImagesFromJsonFile()
        loadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnActionChangeLanguage(_ sender: UIButton) {
        if langCode == 0
        {
            keywordChangeByLangCode = HindiLanguage()
            viewModelUser.ImagesArray = viewModelUser.MainJson.HindiData
            UserDefaults.standard.set(keywordChangeByLangCode.langCode, forKey: "LangCode")
            langCode = UserDefaults.standard.value(forKey: "LangCode") as? Int
         }else{
             keywordChangeByLangCode = EnglishLanguage()
             viewModelUser.ImagesArray = viewModelUser.MainJson.EnglishData
             UserDefaults.standard.set(keywordChangeByLangCode.langCode, forKey: "LangCode")
             langCode = UserDefaults.standard.value(forKey: "LangCode") as! Int
         }
        loadData()
    }
    
    func loadData()
    {
        self.lbl_appName.text = keywordChangeByLangCode.appName
        self.btn_language.setTitle(keywordChangeByLangCode.btnName, for: .normal)
        self.tblViewImg.reloadData()
        //self.viewWillAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelUser.ImagesArray.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell", for: indexPath) as! image_TableViewCell
         cell.lbl_name.text = viewModelUser.ImagesArray[indexPath.row].ImgName
         cell.loadClcView(ImgDataClcArray: viewModelUser.ImagesArray[indexPath.row].ImgData)
         return cell
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(keywordChangeByLangCode.tblCellheight)
    }
}

