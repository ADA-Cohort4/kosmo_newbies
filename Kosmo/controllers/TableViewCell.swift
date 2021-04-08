//
//  TableViewCell.swift
//  Kosmo
//
//  Created by Maritia Pangaribuan on 06/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var challengeName: UILabel!
    @IBOutlet var challengeCellView: UIView!
    @IBOutlet weak var checkIcon: UIImageView!
    
    func setChallenge(challenge: Challenge) {
        backgroundImage.image = challenge.image
        challengeName.text = challenge.title
        challengeCellView.layer.cornerRadius = 10
        if challenge.isDone {
            checkIcon.tintColor = UIColor(red: 63/255, green: 61/255, blue: 86/255, alpha: 1)
        }
        if !challenge.isChallengeEnable {
            challengeCellView.backgroundColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)
        } 
    }
    
    
}
