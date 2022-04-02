//
//  image_CollectionViewCell.swift
//  AppIncubatorDemo
//
//  Created by Apple on 01/04/22.
//

import UIKit

class image_CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView_1: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView_1.image = nil
    }
}
