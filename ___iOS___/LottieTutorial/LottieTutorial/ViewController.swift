//
//  ViewController.swift
//  LottieTutorial
//
//  Created by fabiocunha on 04/10/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let animatioView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
    }
    
    func setupAnimation() {
        animatioView.animation = Animation.named("122255-spooky-pumpkin")
        animatioView.frame = view.bounds
        animatioView.contentMode = .scaleAspectFit
        animatioView.loopMode = .repeat(3)
        animatioView.play()
        view.addSubview(animatioView)
    }


}

