//
//  HomeViewController.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/27/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController {

    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    //MARK: Get data
    func getData() {
        viewModel.updateLoadingStatus = {
            self.viewModel.isLoading ? self.showHud() : self.hideHude()
        }

        viewModel.getMovieTrendingMoya(view) { (model) in
            self.viewModel.movies = model
            let cardSlider = CardSliderViewController.with(dataSource: self)
            cardSlider.title = "Trending"
            self.present(cardSlider, animated: true, completion: nil)
        }
    }
}

//MARK: Card slider
extension HomeViewController: CardSliderDataSource {
    func item(for index: Int) -> CardSliderItem {
        return viewModel.movies[index]
    }
    
    func numberOfItems() -> Int {
        return viewModel.movies.count
    }
}
