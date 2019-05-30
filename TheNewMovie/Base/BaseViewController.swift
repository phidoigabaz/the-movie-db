//
//  BaseViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Reachability

class BaseViewController: UIViewController {
    
    let reachability = Reachability()
    var infoWindow = ViewPlayer()
    var isShowPlayer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        
    }
    
    func setupNav() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    //MARK: viewPlayer
    func loadNiB() -> ViewPlayer {
        let infoWindow = ViewPlayer.instanceFromNib()
        return infoWindow
    }
    
    func addViewPlayer(yKey: String, yName: String, ySite: String, yType: String) {
        if let miniPlayerView = Constants.appDelegate.window {
            miniPlayerView.viewWithTag(1)?.removeFromSuperview()
        }
        infoWindow.removeFromSuperview()
        infoWindow = loadNiB()
        infoWindow.keyYoutube = yKey
        infoWindow.nameVideoLabel.text = yName
        infoWindow.siteVideoLabel.text = "\(yType) - \(ySite)"
        infoWindow.typeFullLabel.text = "\(yType) - \(ySite)"
        infoWindow.nameFullLabel.text = yName
        if let mPlayer = Constants.appDelegate.window {
            infoWindow.frame = CGRect(x: 0, y: 0, width: Constants.iWidth, height: Constants.iHeight)
            infoWindow.center = mPlayer.center
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = .fade //choose your animation
            mPlayer.layer.add(transition, forKey: nil)
            mPlayer.addSubview(infoWindow)
            infoWindow.isShowMini = false
        }
    }
    
    @objc func menuButtonBarItem() {
        print("menu")
        //mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    
    @objc func searchButtonBarItem() {
        print("search")
    }
}

//textField keyboard show/hide
//extension BaseViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: true)
//    }
//     Finish Editing The Text Field
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: false)
//    }
//    
//    // Hide the keyboard when the return key pressed
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    // Move the text field in a pretty animation!
//    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
//        let moveDuration = 0.3
//        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
//        
//        UIView.beginAnimations("animateTextField", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(moveDuration)
//        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
//        UIView.commitAnimations()
//    }
//}
