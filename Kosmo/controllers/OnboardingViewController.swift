//
//  OnboardingViewController.swift
//  Kosmo
//
//  Created by Azrullah Kainage on 07/04/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var box: UIView!
    @IBOutlet weak var icon: UIView!
    @IBOutlet weak var startLearning: UIButton!
    @IBOutlet weak var icon2: UIView!
    @IBOutlet weak var icon3: UIView!
    //      userDefault
    let defaults = UserDefaults.standard
    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMainPage", sender: nil)
        defaults.setValue(true, forKey: "isSignin")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//      box style
        box.layer.cornerRadius = 20
        box.layer.shadowColor = UIColor.darkGray.cgColor
        box.layer.shadowOpacity = 0.2
        box.layer.shadowOffset = .zero
//      icon with teks
        icon.layer.cornerRadius = 20
        icon.layer.borderWidth = 5
        icon2.layer.cornerRadius = 20
        icon2.layer.borderWidth = 5
        icon3.layer.cornerRadius = 20
        icon3.layer.borderWidth = 5
//      button style
        startLearning.layer.cornerRadius = 10
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//      redirect
        let isSignin = defaults.bool(forKey: "isSignin")
        if (isSignin == true) {
            performSegue(withIdentifier: "goToMainPage", sender: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
