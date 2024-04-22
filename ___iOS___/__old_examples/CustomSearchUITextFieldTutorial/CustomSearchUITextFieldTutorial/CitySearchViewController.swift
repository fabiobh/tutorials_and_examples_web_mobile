//
//  ViewController.swift
//  CustomSearchUITextFieldTutorial
//
//  Created by Fabio Cunha on 29/04/23.
//

import UIKit

class CitySearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var field: UITextField!
    
    var data = [String]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        //table.reloadData()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //print("\(query)")
        
        if let text = textField.text {
            filterText(text + string)
        }
        
        return true
    }
    
    private func filterText(_ query: String) {
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        table.reloadData()
    }
    
    private func setupData() {
        data.append("John")
        data.append("Abe")
        data.append("Mac")
        data.append("Johnny")
        data.append("Paul")
        data.append("Logan")
        data.append("Chris")
        data.append("Leon")
        data.append("Claire")
    }


}

extension CitySearchViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.row) - \(data[indexPath.row])")
    }
}
