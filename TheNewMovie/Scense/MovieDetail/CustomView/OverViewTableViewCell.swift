//
//  OverViewTableViewCell.swift
//  Dappmovie
//
//  Created by taddat on 2/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindingData(_ model: MovieDetailModel) {
        overviewLabel.text = model.overview
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
