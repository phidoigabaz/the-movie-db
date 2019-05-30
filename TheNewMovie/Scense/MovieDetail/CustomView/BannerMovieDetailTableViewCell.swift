
//
//  BannerMovieDetailTableViewCell.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Kingfisher

protocol BannerMovieDetailTableViewCellDelegate: NSObjectProtocol {
    func didSelectBanner(_ cell: BannerMovieDetailTableViewCell, sender: Any)
    func didSelectPlayVideo(_ cell: BannerMovieDetailTableViewCell, sender: Any)
}

class BannerMovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var timeGenresLabel: UILabel!
    @IBOutlet weak var floatRatingView: FloatRatingView!
    
    weak var delegate: BannerMovieDetailTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backdropImageView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: backdropImageView.bounds.height), colors: [.clear, .white])
    }
    
    func bindingData(_ model: MovieDetailModel) {
        titleMovie?.text = model.title
        if let timeMovie = timeGenresLabel.text {
            timeGenresLabel?.text = "\(timeMovie.formaterRuntime(time: model.runtime)) | Actions"
        }
        floatRatingView.rating = model.voteAverage / 2
        if let backdropUrl = URL(string: "\(Constants.kUrlImage)\(model.backdropPath)"),
           let posterUrl = URL(string: "\(Constants.kUrlImage)\(model.posterPath)") {
            backdropImageView.kf.setImage(with: backdropUrl)
            posterImageView.kf.setImage(with: posterUrl)
        }
    }
    
    @IBAction func onSelectBannerAction(_ sender: Any) {
        delegate?.didSelectBanner(self, sender: sender)
    }
    
    @IBAction func onPlayVideoAction(_ sender: Any) {
        delegate?.didSelectPlayVideo(self, sender: sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
