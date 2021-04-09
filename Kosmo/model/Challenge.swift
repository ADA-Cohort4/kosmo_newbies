//
//  Challenges.swift
//  Kosmo
//
//  Created by Maritia Pangaribuan on 06/04/21.
//

import UIKit

class Challenge {
    var title: String
    var image: UIImage
    var isDone: Bool
    var isChallengeEnable: Bool
    
    init(title: String, image: UIImage, isDone: Bool, isChallengeEnable: Bool) {
        self.title = title
        self.image = image.withTintColor(.white,renderingMode: .alwaysOriginal)
        self.isDone = isDone
        self.isChallengeEnable = isChallengeEnable
    }
}
