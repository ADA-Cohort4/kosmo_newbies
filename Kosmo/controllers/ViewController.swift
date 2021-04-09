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
    var Challenges: [Challenge] = []
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    @IBOutlet weak var buttonThumbnail: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Challenges  = createArray()
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Sequence"
        navigationItem.backBarButtonItem = backBarBtnItem

        backhomeButton.layer.cornerRadius = 10
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        emojiImage.image = #imageLiteral(resourceName: "celebrate")
        backhomeButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)    
    }
    
    @IBAction func playVideo (_ sender: UIView) {
        let videoPath = Bundle.main.path(forResource: "v1", ofType: "mov")
        let videoPathURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURL)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }

    
    func createArray() -> [Challenge] {
        var challenges: [Challenge] = []
        let challenge1 = Challenge(title: "Tower of Hanoi", image: (UIImage(named: "building")!), isDone: true, isChallengeEnable: true)
        let challenge2 = Challenge(title: "Tukar Gelas", image: UIImage(named: "hourglass")!, isDone: false, isChallengeEnable: false)
        let challenge3 = Challenge(title: "Masak Telor", image: UIImage(named: "flame")!, isDone: false, isChallengeEnable: false)
        
        challenges.append(challenge1)
        challenges.append(challenge2)
        challenges.append(challenge3)
        
        return challenges
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let challenge = Challenges[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeCell") as! TableViewCell
        cell.setChallenge(challenge: challenge)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChallenge = Challenges[indexPath.row]
        if selectedChallenge.isChallengeEnable {
            performSegue(withIdentifier: "goToNextPage", sender: nil)
        }
    }
}

