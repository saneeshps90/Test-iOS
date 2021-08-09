//
//  ImageListTableViewCell.swift
//  MindTech
//
//  Created by Saneesh Sathyavan on 09/08/21.
//

import UIKit

class ImageListTableViewCell: UITableViewCell {
    @IBOutlet weak var cellOuterView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func loadCellData(cellData : ModelData){
        cellImageView.image = UIImage(named: cellData.posterImage)
        cellLabel.text = cellData.name
        
    }

}
