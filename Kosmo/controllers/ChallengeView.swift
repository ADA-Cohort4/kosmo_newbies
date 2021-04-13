//
//  ChallengeView.swift
//  Kosmo
//
//  Created by Maritia Pangaribuan on 08/04/21.
//

import UIKit

class ChallengeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var instructionView: UIView!
    var challengeControllerDelegate: ChallengeControllerDelegate?
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("ChallengeView", owner: self, options: nil)
        addSubview(instructionView)
        instructionView.frame = self.bounds
        startButton.layer.cornerRadius = 10
    }
    
    @IBAction func handleStart(_ sender: Any) {
        challengeControllerDelegate?.startChallengeDidTab()
        print("Hello from the other side")
    }
    
    
}
