//
//  ViewController.swift
//  Kosmo
//
//  Created by Azrullah Kainage on 06/04/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var successTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var explainTitle: UILabel!
    @IBOutlet weak var backhomeButton: UIButton!
    @IBOutlet weak var emojiImage: UIImageView!
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    @IBOutlet weak var buttonThumbnail: UIButton!
    
    @IBAction func playVideo (_ sender: UIView) {
        let videoPath = Bundle.main.path(forResource: "v1", ofType: "mov")
        let videoPathURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURL)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
}

