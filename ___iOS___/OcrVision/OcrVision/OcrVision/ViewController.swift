//
//  ViewController.swift
//  OcrVision
//
//  Created by fabiocunha on 23/05/22.
//

import UIKit
import Vision

class ViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 320, height: 200))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .red
        label.text = "Starting..."
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 250, width: 320, height: 50))
        button.backgroundColor = .green
        button.setTitle("recognize image", for: .normal)
        button.addTarget(self, action: Selector(("pressed")), for: .touchUpInside)
            
        return button
    }()
    
    @objc func pressed() {
        print("button pressed")
        recognizeText(image: imageView.image)
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "example3")
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(imageView)
        
        //recognizeText(image: imageView.image)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(x:20, y: view.safeAreaInsets.top,
                                 width: view.frame.size.width-40,
                                 height: view.frame.size.width-40)
        
        imageView.frame = CGRect(x:20,
                                 y: view.frame.size.width + view.safeAreaInsets.top,
                                 width: view.frame.size.width-40,
                                 height: 200)
        
    }
    
    private func recognizeText(image: UIImage?) {
        guard let cgImage = image?.cgImage else { return }
        
        // Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        // Request
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let observation = request.results as? [VNRecognizedTextObservation],
                    error == nil else {
                        print("failed")
                return
            }
            
            let text = observation.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
            
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        
        // process request
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        
    }


}

