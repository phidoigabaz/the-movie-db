//
//  CastCollectionViewCell.swift
//  Dappmovie
//
//  Created by taddat on 2/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var nameCastLabel: UILabel!
    @IBOutlet weak var titleCastLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        castImageView.frame.size.height = 60
        castImageView.layer.cornerRadius = castImageView.frame.size.height/2
        castImageView.contentMode = .scaleAspectFill
        castImageView.layer.masksToBounds = false
        castImageView.clipsToBounds = true
    }
    
    func bindingData(_ model: CastModel) {
        nameCastLabel.text = model.name
        titleCastLabel.text = model.character
        if let url = URL(string: "\(Constants.kUrlImage)\(model.profilePath)") {
            castImageView.kf.setImage(with: url)
        }
    }
}
