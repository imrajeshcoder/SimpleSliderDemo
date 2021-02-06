//
//  imageCellCollectionViewCell.swift
//  Slider
//
//  Created by Vijay on 06/02/21.
//

import UIKit

class imageCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgSliderImage: UIImageView!
    
    func changeImage(imgName: String) {
        imgSliderImage.image = UIImage(named: imgName)
    }
}
