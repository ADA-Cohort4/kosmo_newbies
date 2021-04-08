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
    
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    @IBOutlet weak var thumbnail: UIView!
    @IBOutlet weak var buttonThumbnail: UIButton!
    
    @IBAction func playVideo (_ sender: UIView) {
        let videoPath = Bundle.main.path(forResource: "example", ofType: "mp4")
        let videoPathURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURL)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

