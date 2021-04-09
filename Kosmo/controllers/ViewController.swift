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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // test
        
        backhomeButton.layer.cornerRadius = 10
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        emojiImage.image = #imageLiteral(resourceName: "celebrate")
        backhomeButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)    
    }
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

