//
//  ViewController.swift
//  LottieTest
//
//  Created by Fabio Cunha on 05/04/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    private var animationView = LottieAnimationView(name: "lf20_HgDft2")
    
    //var animationView = LOTAnimationView(name: "lottie_animation_file")
    @IBOutlet weak var lottieAnimationViewStoryboard: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieAnimationViewStoryboard.frame = view.bounds
        lottieAnimationViewStoryboard.contentMode = .scaleAspectFit
        lottieAnimationViewStoryboard.animationSpeed = 1.0
        lottieAnimationViewStoryboard.backgroundColor = .clear
        lottieAnimationViewStoryboard.loopMode = .loop
        //lottieAnimationViewStoryboard.play()
        lottieAnimationViewStoryboard.play(fromFrame: 0, toFrame: 60, loopMode: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            self.lottieAnimationViewStoryboard.stop()
            self.lottieAnimationViewStoryboard.isHidden = true
        }
        
        
    }
    

}

