//
//  NavigationController.swift
//  Kosmo
//
//  Created by Maritia Pangaribuan on 07/04/21.
//

import UIKit



class ChallengeController: UIViewController {
    
    @IBOutlet weak var instructionView: ChallengeView!   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Sequence"
        navigationItem.backBarButtonItem = backBarBtnItem
        instructionView.challengeControllerDelegate = self
        
    }
    
}


protocol ChallengeControllerDelegate {
    func startChallengeDidTab()
}

extension ChallengeController: ChallengeControllerDelegate {
    func startChallengeDidTab() {
        performSegue(withIdentifier: "goToChallenge", sender: nil)
    }
}


