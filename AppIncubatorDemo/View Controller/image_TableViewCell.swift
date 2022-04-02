//
//  image_TableViewCell.swift
//  AppIncubatorDemo
//
//  Created by Apple on 01/04/22.
//

import UIKit
import SDWebImage

class image_TableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var clcView_image: UICollectionView!
    var ImgDataClcArray = [ImageListClcData]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadClcView(ImgDataClcArray : [ImageListClcData])
    {
        self.ImgDataClcArray = ImgDataClcArray
        self.clcView_image.delegate = self
        self.clcView_image.dataSource = self
        self.clcView_image.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ImgDataClcArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clcCell", for: indexPath) as! image_CollectionViewCell
        cell.imageView_1.sd_setImage(with: URL(string : "\(self.ImgDataClcArray[indexPath.row].imgUrl)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!), placeholderImage: UIImage(named: ""))
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize = CGSize(width: (collectionView.frame.width)/2, height: (collectionView.frame.height))
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIImageView {
public func imageFromServerURL(urlString: String) {
    self.image = nil
    let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
    URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in

        if error != nil {
            print(error as Any)
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
        })

    }).resume()
}}
