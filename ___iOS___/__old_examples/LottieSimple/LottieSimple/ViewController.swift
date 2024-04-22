//
//  ViewController.swift
//  LottieSimple
//
//  Created by Fabio Cunha on 17/11/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Set animation content mode
          
          //animationView.contentMode = .scaleAspectFit
          
          // 2. Set animation loop mode
          
          //animationView.loopMode = .loop
          
          // 3. Adjust animation speed
          
          //animationView.animationSpeed = 0.5
          
          // 4. Play animation
          animationView.play()
         
    }


}

