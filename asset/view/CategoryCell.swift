//
//  CategoryCell.swift
//  photobazar
//
//  Created by eitysams on 2/23/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryimg: UIImageView!
    
    @IBOutlet weak var categorylbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryimg.layer.cornerRadius = 5
        
    }
    func configurcell(category:catrgory)  {
        
        categorylbl.text = category.name
        if let url = URL(string: category.imUrl){
        categoryimg.kf.setImage(with: url)
            
    }

  }
}
