//
//  ViewController.swift
//  Kosmo
//
//  Created by Azrullah Kainage on 06/04/21.
//

import UIKit

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


}

