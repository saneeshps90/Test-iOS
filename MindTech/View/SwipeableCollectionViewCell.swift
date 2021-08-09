//
//  SwipeableCollectionViewCell.swift
//  MindTech
//
//  Created by Saneesh Sathyavan on 09/08/21.
//

import UIKit

class SwipeableCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var swipeableImageView: UIImageView!
    
   // var cellData : ModelData!
    override class func awakeFromNib() {
        
    }
    
    func loadCell(cellData: ModelData){
        swipeableImageView.image = UIImage(named: cellData.posterImage)
    }
}
