//
//  SearchViewController.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/28/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var notfoundLabel: UILabel!
    
    var viewModel = SearchViewModel()
    var keyword: String = ""
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for:.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.delegate = self
    }
    
    
    //MARK: METHODS
    func getData() {
        currentPage = 1
        let pager = Pager(page: currentPage, current_page: Constants.kDefaultLimit)
        if keyword == searchTextField?.text {
            viewModel.searchMovieMoya(view, keyword, pager) { (model) in
                if model.count != 0 {
                    self.notfoundLabel.isHidden = true
                    self.tableView.isHidden = false
                    self.viewModel.searchModel.removeAll()
                    self.viewModel.searchModel = model
                    self.tableView.reloadData()
                } else {
                    self.tableView.reloadData()
                    self.tableView.isHidden = true
                    self.notfoundLabel.isHidden = false
                }
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        DispatchQueue.main.async {
            if self.searchTextField == textField, (textField.text?.trim().isEmpty)! {
                textField.resignFirstResponder()
            }
        }
    }
    
    
    //MARK: ACTIONS
    @IBAction func onDimissPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        tableView.removeFromSuperview()
    }
}

extension SearchViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keyword = (textField.text?.trim())!
        if keyword.count != 0 {
            textField.resignFirstResponder()
            viewModel.updateLoadingStatus = {
                self.viewModel.isLoading ? self.showHud() : self.hideHude()
            }
            getData()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.reloadData()
        } else {
            textField.text = ""
            textField.resignFirstResponder()
        }
        return true
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SearchItemTableViewCell.dequeueReuseCellWithNib(in: tableView,
                                                                   reuseIdentifier: SearchItemTableViewCell.nibName())
        cell.bindingWithData(viewModel.searchModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MovieDetailViewModel.presentMovieDetailModule(viewModel.getMovieId(indexPath.row), navigation: self)
    }
}

struct listFilter {
    var title: String
    var desc: String
    var image: String
    
    init(_ title: String,_ desc: String,_ image: String) {
        self.title = title
        self.desc = desc
        self.image = image
    }
}
