//
//  ChallengePopupControllerViewController.swift
//  Kosmo
//
//  Created by Maritia Pangaribuan on 08/04/21.
//

import UIKit

class ChallengePopupControllerViewController: UIViewController {

    @IBOutlet weak var homeIndicator: UIView!
    @IBOutlet weak var challengePopup: ChallengeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        challengePopup.startButton.isHidden = true
        homeIndicator.layer.cornerRadius = 2
    }
    
}
