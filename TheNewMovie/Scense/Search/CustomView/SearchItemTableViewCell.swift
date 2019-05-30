//
//  SearchItemTableViewCell.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/29/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Kingfisher

class SearchItemTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 5
        thumbImageView.layer.masksToBounds = true
    }
    
    func bindingWithData(_ model: RowModel) {
        titleLabel.text = model.title
        descLabel.text = "Vote: \(model.voteCount), release date: \(model.releaseDate)"
        if let url = URL(string: "\(Constants.kUrlImage)\(model.posterPath)") {
            thumbImageView.kf.setImage(with: url)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
