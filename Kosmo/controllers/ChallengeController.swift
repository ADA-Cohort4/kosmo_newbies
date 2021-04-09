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
        backBarBtnItem.title = "something different"
        navigationItem.backBarButtonItem = backBarBtnItem
    }
    
}

