//
//  ViewController.swift
//  Kosmo
//
//  Created by Azrullah Kainage on 06/04/21.
//

import UIKit

class TOHViewController: UIViewController {

    @IBOutlet weak var InfoBtn: UIButton!
    @IBOutlet weak var CheckBtn: UIButton!
    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var KosmoBG: UIImageView!
    @IBOutlet weak var Tower1: UIImageView!
    @IBOutlet weak var Tower2: UIImageView!
    @IBOutlet weak var Tower3: UIImageView!
    @IBOutlet weak var GameView: UIView!
    @IBOutlet weak var Disk1: UIView!
    @IBOutlet weak var Disk2: UIView!
    @IBOutlet weak var Disk3: UIView!
    @IBOutlet weak var Pan1: UIPanGestureRecognizer!
    @IBOutlet weak var Pan2: UIPanGestureRecognizer!
    @IBOutlet weak var Pan3: UIPanGestureRecognizer!
    
    private var initialCenter: CGPoint = .zero
    
    private let pannableView: UIView = {
        // Initialize View
        let view = UIView(frame: CGRect(origin: .zero,
                        size: CGSize(width: 100.0, height: 20.0)))

        // Configure View
        view.backgroundColor = UIColor(red: 128/255.00, green: 147/255.00, blue: 241/255.00, alpha: 1.00)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        KosmoBG.image = #imageLiteral(resourceName: "KosmoBG")
        CheckBtn.layer.cornerRadius = 10
        GameView.layer.cornerRadius = 10
        Disk1.layer.cornerRadius = 8
        Disk2.layer.cornerRadius = 8
        Disk3.layer.cornerRadius = 8

        Disk1.translatesAutoresizingMaskIntoConstraints = false
        Disk2.translatesAutoresizingMaskIntoConstraints = false
        Disk3.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to View Hierarchy
//        view.addSubview(pannableView)
//        view.addSubview(Disk1)

        // Center Pannable View
//        pannableView.center = view.center
//        Disk1.center = view.center
        
        // Initialize Swipe Gesture Recognizer
        let panGestureRecognizer1 = UIPanGestureRecognizer(target: self, action: #selector(didPan1(_:)))
        let panGestureRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(didPan2(_:)))
        let panGestureRecognizer3 = UIPanGestureRecognizer(target: self, action: #selector(didPan3(_:)))
        
        // Add Swipe Gesture Recognizer
//        pannableView.addGestureRecognizer(panGestureRecognizer)
        Disk1.addGestureRecognizer(panGestureRecognizer1)
        Disk2.addGestureRecognizer(panGestureRecognizer2)
        Disk3.addGestureRecognizer(panGestureRecognizer3)
    }
    
    @objc private func didPan1(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began:
                initialCenter = Disk1.center
            case .changed:
                let translation = sender.translation(in: view)

                Disk1.center = CGPoint(x: initialCenter.x + translation.x,
                                              y: initialCenter.y + translation.y)
            case .ended,
                 .cancelled:
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                    self.Disk1.center = self.initialCenter
                }
            default:
                break
            }
    }
    
    @objc private func didPan2(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began:
                initialCenter = Disk2.center
            case .changed:
                let translation = sender.translation(in: view)

                Disk2.center = CGPoint(x: initialCenter.x + translation.x,
                                              y: initialCenter.y + translation.y)
            case .ended,
                 .cancelled:
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                    self.Disk2.center = self.initialCenter
                }
            default:
                break
            }
    }
    
    @objc private func didPan3(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began:
                initialCenter = Disk3.center
            case .changed:
                let translation = sender.translation(in: view)

                Disk3.center = CGPoint(x: initialCenter.x + translation.x,
                                              y: initialCenter.y + translation.y)
            case .ended,
                 .cancelled:
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                    self.Disk3.center = self.initialCenter
                }
            default:
                break
            }
    }
    
    class ImgData : ObservableObject{
        @Published var totalImages : [Img] = [
            Img(id: 0, image: "Disk1"),Img(id: 0, image: "Disk2"),Img(id: 0, image: "Disk3")
        ]
    }
    
    struct  Img : Identifiable {
        var id : Int
        var image : String
    }


}

