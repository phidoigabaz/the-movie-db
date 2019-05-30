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

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: FloatRatingView!
    
    var viewModel = HomeViewModel()
    var rowModel: [RowModel] = []
    var lastContentOffset = CGFloat()
    var scrollDir = UISwipeGestureRecognizer.Direction.left
    
    lazy var cardLayout: CardCollectionViewLayout = {
        let layout = CardCollectionViewLayout()
        layout.maximumVisibleItems = 4
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    override func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = cardLayout
        collectionView.layer.cornerRadius = 10
        if Constants.iIphone5 {
            cardLayout.itemSize = CGSize(width: 200, height: 250)
        } else {
            cardLayout.itemSize = CGSize(width: collectionView.bounds.size.width - 40 ,
                                         height: collectionView.bounds.size.height - 50 )
        }
        
        let cellNib = UINib(nibName: HomeItemCollectionViewCell.nibName(), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: HomeItemCollectionViewCell.nibName())
        collectionView.reloadData()
    }
    
    override func setupNav() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem.filterBarItem(target: self, btnAction: #selector(onFilterAction))
    }
    
    //MARK: Get data
    func getData() {
        viewModel.updateLoadingStatus = {
            self.viewModel.isLoading ? self.showHud() : self.hideHude()
        }
//        viewModel.getMovieTrending(view) { (model) in
//            self.viewModel.rowModel = model
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//                if let data = model.first {
//                    self.getInfoMovie(data)
//                }
//            }
//        }
        
        viewModel.getMovieTrendingMoya(view) { (model) in
            self.viewModel.rowModel = model
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                
            }
            //self.getInfoMovie(self.cardLayout.maximumVisibleItems)
        }
    }
    
    //MARK: METHODS
    func getInfoMovie(_ index: Int) {
        titleLabel.text = viewModel.rowModel[index].title
        overViewLabel.text = viewModel.rowModel[index].overview
        ratingLabel.text = viewModel.rowModel[index].voteAverage.description
        ratingView.rating = viewModel.rowModel[index].voteAverage/2
    }
    
    //MARK: ACTIONS
    @objc func onFilterAction() {
        print("filter")
    }
    
    @IBAction func onSearchPressed(_ sender: Any) {
        print("search")
        let searchVC = SearchViewController.initWithDefaultNib()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.rowModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.nibName(),
                                                      for: indexPath) as! HomeItemCollectionViewCell
        cell.bindingWithData(viewModel.rowModel[indexPath.row])
        cell.loadContent()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MovieDetailViewModel.presentMovieDetailModule(viewModel.rowModel[indexPath.row].id,
                                                      navigation: navigationController!)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(indexPath.row)
        getInfoMovie(0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if collectionView == scrollView {
            if (self.lastContentOffset > collectionView.contentOffset.x)
            {
                print("scroll left")
            }
            else if (self.lastContentOffset < collectionView.contentOffset.x)
            {
                print("scroll right")
            }
            self.lastContentOffset = collectionView.contentOffset.x;
        }
    }
}
