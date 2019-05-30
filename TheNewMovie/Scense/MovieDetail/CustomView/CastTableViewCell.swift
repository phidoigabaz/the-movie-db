//
//  CastTableViewCell.swift
//  Dappmovie
//
//  Created by taddat on 2/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol CastTableViewCellDelegate: NSObjectProtocol {
    func didSelectonSeeallAction(_ cell: CastTableViewCell, sender: Any)
    func didSelectCollectionViewItem(_ cell: CastTableViewCell, indexPath: IndexPath)
}

class CastTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeAllLabel: UILabel!
    @IBOutlet weak var onSeeallButton: UIButton!
    var castModel: [CastModel] = []
    weak var delegate: CastTableViewCellDelegate?
    var isSeeall: Bool = true
    var isStatusSeeall: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: CastCollectionViewCell.nibName(), bundle: nil),
                                forCellWithReuseIdentifier: CastCollectionViewCell.nibName())
        collectionView.delegate = self
        collectionView.dataSource = self
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 120, height: 120)
            self.collectionView.collectionViewLayout = flowLayout
        }
        collectionView.reloadData()
        seeAllLabel.text = isSeeall ? "See all" : "Cancel"
    }
    
    func bindingData(_ model: [CastModel]) {
        castModel = model
    }
    
    @IBAction func onSeeallAction(_ sender: Any) {
        delegate?.didSelectonSeeallAction(self, sender: sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CastTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSeeall == true ? 5 : castModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.nibName(), for: indexPath) as! CastCollectionViewCell
        if castModel.count > 0 {
            cell.bindingData(castModel[indexPath.row])
            isSeeall = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCollectionViewItem(self, indexPath: indexPath)
    }
}
