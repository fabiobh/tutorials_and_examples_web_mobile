//
//  ViewController.swift
//  ViewCodeTest
//
//  Created by fabiocunha on 24/08/22.
//

import UIKit

class ViewController: UIViewController {
    
//    private let myView:UIViewController = {
//       let vc = UIViewController()
//        return vc
//    }()
    
    private var btConsultar:UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .blue
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private var textViewChipAnimal:UITextView = {
        var tv = UITextView()
        tv.backgroundColor = .blue
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var textViewPropriedade:UITextView = {
        var tv = UITextView()
        tv.backgroundColor = .blue
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var textFieldPropriedade:UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private var textFieldChipAnimal:UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupViewElements()
        
    }
    
    func setupViewElements(){
        
        self.view.backgroundColor = .white
        self.title = "Pesquisa Resenha"
        
        //let myColor2 : UIColor = UIColor(red: 0.0, green: 0.9, blue: 0.9, alpha: 1.0);
        let myColor:UIColor = .lightGray
        
        let textViewHeight:CGFloat = 30
        let textFiledHeight:CGFloat = 30
        let buttonHeight:CGFloat = 50
        
        // 1
        self.view.addSubview(textViewPropriedade)
        textViewPropriedade.backgroundColor = .red
        textViewPropriedade.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textViewPropriedade.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true
        textViewPropriedade.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textViewPropriedade.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textViewPropriedade.textAlignment = .justified
        textViewPropriedade.text = "Digite o número da propriedade"

        // 2
        self.view.addSubview(textFieldPropriedade)
        textFieldPropriedade.topAnchor.constraint(equalTo: textViewPropriedade.bottomAnchor, constant: 10).isActive = true
        textFieldPropriedade.heightAnchor.constraint(equalToConstant: textFiledHeight).isActive = true
        textFieldPropriedade.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldPropriedade.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textFieldPropriedade.textAlignment = .justified
        textFieldPropriedade.placeholder = "exemplo: 123456789012345"
        //textFieldChipAnimal.backgroundColor = .lightGray
        textFieldPropriedade.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldPropriedade.layer.borderWidth = 1
        textFieldPropriedade.layer.borderColor = myColor.cgColor
        textFieldPropriedade.keyboardType = .numberPad
        
        // 3
        self.view.addSubview(textViewChipAnimal)
        textViewChipAnimal.topAnchor.constraint(equalTo: textFieldPropriedade.bottomAnchor, constant: 10).isActive = true
        textViewChipAnimal.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true
        textViewChipAnimal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textViewChipAnimal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textViewChipAnimal.textAlignment = .justified
        textViewChipAnimal.text = "Digite o número do chip do animal"
                        
        // 4
        self.view.addSubview(textFieldChipAnimal)
        textFieldChipAnimal.topAnchor.constraint(equalTo: textViewChipAnimal.bottomAnchor, constant: 10).isActive = true
        textFieldChipAnimal.heightAnchor.constraint(equalToConstant: textFiledHeight).isActive = true
        textFieldChipAnimal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldChipAnimal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textFieldChipAnimal.textAlignment = .justified
        textFieldChipAnimal.placeholder = "exemplo: 123456789012345"
        //textFieldChipAnimal.backgroundColor = .lightGray
        textFieldChipAnimal.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldChipAnimal.layer.borderWidth = 1
        textFieldChipAnimal.layer.borderColor = myColor.cgColor
        textFieldChipAnimal.keyboardType = .numberPad
        
        // 5
        self.view.addSubview(btConsultar)
        btConsultar.setTitle("CONSULTAR", for: .normal)
        btConsultar.backgroundColor = .red
        btConsultar.addTarget(self, action: #selector(consultarResenhaComChipComPropriedade), for: .touchUpInside)
        btConsultar.topAnchor.constraint(equalTo: textFieldChipAnimal.bottomAnchor, constant: 10).isActive = true
        btConsultar.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        btConsultar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btConsultar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        

    }
    
    @objc func consultarResenhaComChipComPropriedade() {
        print("consultarResenhaComChipComPropriedade")
    }
}
