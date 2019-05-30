//
//  HomeItemCollectionViewCell.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/27/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Kingfisher

class HomeItemCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindingWithData(_ model: RowModel) {
        if let url = URL(string: "\(Constants.kUrlImage)\(model.posterPath)") {
            thumbImageView.kf.setImage(with: url)
        }
    }
    
    func loadContent() {
        self.layer.cornerRadius = 10
    }
}
