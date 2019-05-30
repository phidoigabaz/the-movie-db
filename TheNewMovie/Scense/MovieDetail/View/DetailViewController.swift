//
//  DetailViewController.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/27/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dimissButton: UIButton!
    
    var viewModel = MovieDetailViewModel()
    var movieId: Int = 0
    
    init(_ id:Int) {
        super.init(nibName: "DetailViewController", bundle: nil)
        self.movieId = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    override func setupView() {
        dimissButton.setRadiusView(dimissButton.frame.size.height/2)
        tableView.contentInsetAdjustmentBehavior = .never
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.scrollIndicatorInsets = view.safeAreaInsets
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: METHODS
    func getData() {
        viewModel.updateLoadingStatus = {
            self.viewModel.isLoading ? self.showHud() : self.hideHude()
        }
        viewModel.getMovieDetailMoya(view, movieId) { (model) in
            self.viewModel.movieDetailModel = model
            self.tableView.reloadData()
        }
        viewModel.getDetailCastMoya(view, movieId) { (model) in
            self.viewModel.castModel = model
            self.tableView.reloadData()
        }
    }
    
    //MARK: ACTIONS
    @IBAction func onDimissPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieDetailModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.movieDetailModel[indexPath.row]
        if indexPath.section == 0 {
            let cell = BannerMovieDetailTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                              reuseIdentifier: BannerMovieDetailTableViewCell.nibName())
            cell.delegate = self
            cell.bindingData(data)
            return cell
        } else if indexPath.section == 1 {
            let cell = OverViewTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                     reuseIdentifier: OverViewTableViewCell.nibName())
            cell.bindingData(data)
            return cell
        } else if indexPath.section == 2 {
            let cell = CastTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                     reuseIdentifier: CastTableViewCell.nibName())
            cell.delegate = self
            cell.bindingData(viewModel.castModel)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.setHeightRow(indexPath.section, tableView: tableView)
    }
}

extension DetailViewController: BannerMovieDetailTableViewCellDelegate {
    func didSelectPlayVideo(_ cell: BannerMovieDetailTableViewCell, sender: Any) {
        if let path = tableView.indexPath(for: cell) {
            if let player = viewModel.movieDetailModel.first?.videos,player.count != 0 {
                let key = player[path.row].videosKey
                let name = player[path.row].videosName
                let size = player[path.row].videosSize
                let type = player[path.row].videosType
                addViewPlayer(yKey: key, yName: name, ySite: String(size), yType: type)
            } else {
                self.view.makeToast("Not video!!!")
            }
        }
    }
    
    func didSelectBanner(_ cell: BannerMovieDetailTableViewCell, sender: Any) {
    
    }
}

extension DetailViewController: CastTableViewCellDelegate {
    func didSelectCollectionViewItem(_ cell: CastTableViewCell, indexPath: IndexPath) {
        
    }
    
    func didSelectonSeeallAction(_ cell: CastTableViewCell, sender: Any) {
        cell.isStatusSeeall == true ? viewModel.doReloadCastRow(cell, text: Constants.kCancel, bool: false) :
                                      viewModel.doReloadCastRow(cell, text: Constants.kSeeall, bool: true)
    }
}
