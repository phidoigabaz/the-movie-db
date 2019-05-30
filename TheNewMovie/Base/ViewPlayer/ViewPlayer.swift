//
//  ViewPlayer.swift
//  Dappmovie
//
//  Created by GEM on 3/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ViewPlayer: UIView {

    @IBOutlet weak var videoPlayerView: YTPlayerView!
    @IBOutlet weak var closeMiniPlayerButton: UIButton!
    @IBOutlet weak var pauseMiniPlayerButton: UIButton!
    @IBOutlet weak var playVideoButton: UIButton!
    @IBOutlet weak var showMiniPlayButton: UIButton!
    @IBOutlet weak var nameVideoLabel: UILabel!
    @IBOutlet weak var siteVideoLabel: UILabel!
    @IBOutlet weak var nameFullLabel: UILabel!
    @IBOutlet weak var typeFullLabel: UILabel!
    @IBOutlet weak var viewInfoVideo: UIView!
    
    var yMiniPlayer: CGFloat = 80
    var hMiniPlayer: CGFloat = 60
    var keyYoutube: String = ""
    
    var isShowMini: Bool = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
        DispatchQueue.main.async {
            let playerVars = [
                //"controls": 1,
                "playsinline" : 1,
                //"autoplay" : 1,
                //"autohide" : 1,
                //"rel" : 0,
                //"showinfo" : 0,
                "modestbranding" : 1
            ]
            self.videoPlayerView.load(withVideoId: self.keyYoutube,playerVars: playerVars)
        }
    }
    
    
    //MARK: METHODS
    @objc func getCurrentTime() {
        
    }
    
    func hideMiniPlayer() {
        self.frame = CGRect(x: 0, y: 0 , width: Constants.iWidth, height: Constants.iHeight)
        self.layoutIfNeeded()
        self.videoPlayerView.frame = CGRect(x: 0, y: 0, width: Constants.iWidth, height: 250)
        addshadowColor(color: .white)
        self.videoPlayerView.layoutIfNeeded()
        self.closeMiniPlayerButton.isHidden = true
        self.pauseMiniPlayerButton.isHidden = true
        self.showMiniPlayButton.isHidden = false
        self.nameVideoLabel.isHidden = true
        self.siteVideoLabel.isHidden = true
        self.viewInfoVideo.isHidden = false
    }
    
    func showMiniPlayer() {
        self.frame = CGRect(x: 16, y: Constants.iHeight - 100 , width: Constants.iWidth - 36, height: self.yMiniPlayer)
        self.layer.cornerRadius = 10
        self.layoutIfNeeded()
        self.videoPlayerView.frame = CGRect(x: 0, y: 0, width: 140, height: self.yMiniPlayer)
        //self.playerLayer.frame = self.videoPlayerView.bounds
        addshadowColor(color: .black)
        self.videoPlayerView.layoutIfNeeded()
        self.closeMiniPlayerButton.isHidden = false
        self.pauseMiniPlayerButton.isHidden = false
        self.showMiniPlayButton.isHidden = true
        self.nameVideoLabel.isHidden = false
        self.siteVideoLabel.isHidden = false
        self.viewInfoVideo.isHidden = true
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            self.hideMiniPlayer()
        }
    }
    //MARK: IBACTION
    
    @IBAction func onShowMiniPlayerAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
           self.showMiniPlayer()
        }
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (someAction (_:)))
        self.addGestureRecognizer(gesture)
    }
    
    @IBAction func onStatusVideoAction(_ sender: Any) {
        pauseMiniPlayerButton.isSelected = !pauseMiniPlayerButton.isSelected
        pauseMiniPlayerButton.isSelected == true ? videoPlayerView.playVideo() : videoPlayerView.pauseVideo()
        pauseMiniPlayerButton.isHighlighted = true
        pauseMiniPlayerButton.isSelected == true ? pauseMiniPlayerButton.setImage(UIImage(named: "pause-button"), for: .normal) : pauseMiniPlayerButton.setImage(UIImage(named: "play-button"), for: .normal)

    }
    
    @IBAction func onCloseMiniPlayerAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    class func instanceFromNib() -> ViewPlayer {
        let view = ViewPlayer.nibDefault().instantiate(withOwner: self, options: nil).first as? ViewPlayer
        return view!
    }
}
