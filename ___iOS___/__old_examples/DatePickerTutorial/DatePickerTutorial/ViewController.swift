//
//  ViewController.swift
//  DatePickerTutorial
//
//  Created by Fabio Cunha on 30/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFT: UITextField!
    
    fileprivate func configDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dataChange(datePicker:)), for: UIControl.Event.valueChanged)
        
        datePicker.frame.size = CGSize(width: 0, height: 100)
        datePicker.preferredDatePickerStyle = .wheels
        
        textFT.inputView = datePicker
        textFT.text = formatDate(date: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDatePicker()
    }

    @objc func dataChange(datePicker: UIDatePicker) {
        textFT.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

}

