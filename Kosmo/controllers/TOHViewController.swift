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
    @IBOutlet weak var btnStack1: UIButton!
    @IBOutlet weak var btnStack2: UIButton!
    @IBOutlet weak var btnStack3: UIButton!
    
    
    private var initialCenter: CGPoint = .zero
    
    var disks = [
        [2,1,0],
        [],
        []
    ]
    var lastPos: CGPoint = .zero
    var prevStack: Int = 0
    var nextStack: Int = 0
    var diskNumber: Int = 0
    var WhichDisk: UIView!
    
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
        let panGestureRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(didPan1(_:)))
        let panGestureRecognizer3 = UIPanGestureRecognizer(target: self, action: #selector(didPan1(_:)))
        
        // Add Swipe Gesture Recognizer
//        pannableView.addGestureRecognizer(panGestureRecognizer)
        btnStack1.addGestureRecognizer(panGestureRecognizer1)
        btnStack2.addGestureRecognizer(panGestureRecognizer2)
        btnStack3.addGestureRecognizer(panGestureRecognizer3)
    }
    
    @IBAction func btn1 (_ sender: UIButton) {
        let arr = self.disks[0]
        setDiskAndStack(arr, 0)
    }
    
    @IBAction func btn2 (_ sender: UIButton) {
        let arr = self.disks[1]
        setDiskAndStack(arr, 1)
    }
    
    @IBAction func btn3 (_ sender: UIButton) {
        let arr = self.disks[2]
        setDiskAndStack(arr, 2)
    }
    
    
    func setDiskAndStack (_ arr: [Int], _ stack: Int) {
        if (arr.count > 0) {
            self.prevStack = stack
            if (arr[arr.count - 1] == 0) {
                self.WhichDisk = self.Disk1
                self.diskNumber = 0
            } else if (arr[arr.count - 1] == 1) {
                self.WhichDisk = self.Disk2
                self.diskNumber = 1
            } else if (arr[arr.count - 1] == 2) {
                self.WhichDisk = self.Disk3
                self.diskNumber = 2
            }
        }
    }
    
    
    @objc private func didPan1(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began:
                initialCenter = WhichDisk.center
                lastPos = WhichDisk.center
                let new = self.disks[self.prevStack].popLast()
                print(new ?? "Disk Error")
            case .changed:
                let translation = sender.translation(in: view)
                WhichDisk.center = CGPoint(x: initialCenter.x + translation.x,
                                              y: initialCenter.y + translation.y)
            case .ended,
                 .cancelled:
                if ((self.WhichDisk.frame.midX >= self.view.layer.frame.width / 3) && (WhichDisk.center.x < 220)){
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        
                        let middleStack = self.disks[1]
                        let middleStackLength = self.disks[1].count
                        if ( middleStackLength == 0) {
                            self.disks[1].append(self.diskNumber)
                            self.WhichDisk.center.x = 171
                            self.WhichDisk.center.y = 235
                        } else {
                            if (middleStack[middleStackLength - 1] > self.diskNumber) {
                                if (middleStackLength == 1) {
                                    self.WhichDisk.center.y = 220
                                } else if (middleStackLength == 2) {
                                    self.WhichDisk.center.y = 205
                                }
                                self.WhichDisk.center.x = 171
                                self.disks[1].append(self.diskNumber)
                            } else {
                                self.WhichDisk.center = self.lastPos
                                self.disks[self.prevStack].append(self.diskNumber)
                            }
                        }
                        print(self.disks)
                    }, completion: nil)
                } else if WhichDisk.center.x >= 220 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        let endStack = self.disks[2]
                        let endStackLength = self.disks[2].count
//                        let firstStackLength = self.disks[0].count
                        if ( endStackLength == 0) {
                            self.disks[2].append(self.diskNumber)
                            self.WhichDisk.center.x = 279
                            self.WhichDisk.center.y = 235
                        } else {
                            if (endStack[endStackLength - 1] > self.diskNumber) {
                                if (endStackLength == 1) {
                                    self.WhichDisk.center.y = 220
                                } else if (endStackLength == 2) {
                                    self.WhichDisk.center.y = 205
                                }
                                self.WhichDisk.center.x = 279
                                self.disks[2].append(self.diskNumber)
                            } else {
                                self.WhichDisk.center = self.lastPos
                                self.disks[self.prevStack].append(self.diskNumber)
                            }
                        }
                        print(self.disks)
                    }, completion: nil)
                } else if WhichDisk.center.x < 120{
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                            self.WhichDisk.center.x = 67
                        let firstStack = self.disks[0]
                        let firstStackLength = self.disks[0].count
                        if ( firstStackLength == 0) {
                            self.disks[0].append(self.diskNumber)
                            self.WhichDisk.center.x = 67
                            self.WhichDisk.center.y = 235
                        } else {
                            if (firstStack[firstStackLength - 1] > self.diskNumber) {
                                if (firstStackLength == 1) {
                                    self.WhichDisk.center.y = 220
                                } else if (firstStackLength == 2) {
                                    self.WhichDisk.center.y = 205
                                }
                                self.WhichDisk.center.x = 67
                                self.disks[0].append(self.diskNumber)
                            } else {
                                self.WhichDisk.center = self.lastPos
                                self.disks[self.prevStack].append(self.diskNumber)
                            }
                        }
                        print(self.disks)
                    }, completion: nil)
                } else {
                    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                            self.WhichDisk.center = self.initialCenter
                    }
                }
            default:
                break
            }
    }
}

