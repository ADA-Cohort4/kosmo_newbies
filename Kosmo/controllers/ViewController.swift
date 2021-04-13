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

    var Challenges: [Challenge] = []
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    @IBOutlet weak var buttonThumbnail: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var thumbnail: UIButton!
    @IBOutlet weak var thumbVideo: UIImageView!
    @IBOutlet weak var navHeader: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Challenges  = createArray()
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Sequence"
        navigationItem.backBarButtonItem = backBarBtnItem
//      aji code
        thumbVideo.layer.shadowColor = UIColor.darkGray.cgColor
        thumbVideo.layer.shadowOpacity = 0.2
        thumbVideo.layer.shadowOffset = .zero
    }
    
//      hide navbar in hompage
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
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
        let challenge1 = Challenge(title: "Menara Hanoi", image: (UIImage(named: "building")!), isDone: true, isChallengeEnable: true)
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

