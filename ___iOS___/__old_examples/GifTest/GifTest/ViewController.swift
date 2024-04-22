//
//  ViewController.swift
//  GifTest
//
//  Created by Fabio Cunha on 29/09/22.
//

import UIKit
import JellyGif

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        start()
    }

    func start() {

        view.backgroundColor = .red
        
//        let blankImageView = UIImageView()
//        blankImageView.backgroundColor = .green
//        blankImageView.frame = CGRect(x: 0,y: 0,width: 100,height: 100)
//        view.addSubview(blankImageView)
        
        var myImageViewGif0 = JellyGifImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myImageViewGif0.startGif(with: .name("gato_felix1"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(2)) {
            myImageViewGif0.pauseGif()
            myImageViewGif0 = JellyGifImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        }
        myImageViewGif0.stopAnimating()
        view.addSubview(myImageViewGif0)
        
        let myImageViewGif = JellyGifImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myImageViewGif.startGif(with: .name("gato_felix1"))
        view.addSubview(myImageViewGif)
//
//        let myImageViewGif2 = JellyGifImageView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
//        myImageViewGif2.startGif(with: .name("gato_felix1"))
//        view.addSubview(myImageViewGif2)

        //Animates Gif with a local path
//        let url = URL(string: "Gif path")!
//        imageView.startGif(with: .localPath(url))

        //Animates Gif with data
        //imageView.startGif(with: .data(Data))
    }
}

