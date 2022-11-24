//
//  ViewController.swift
//  RealmTutorial
//
//  Created by fabiocunha on 28/06/22.
//

import RealmSwift
import UIKit

class ViewController: UIViewController {

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        deleteDataRealm()
        
        saveDataRealm()
        
        render()
    }
    
    
    
    func deleteDataRealm() {
        realm.beginWrite()
        realm.delete(realm.objects(Person.self))
        try! realm.commitWrite()
    }
    
    func saveDataRealm() {
        let joe = Person(firstName: "Big", lastName: "Joe", job: Job())
        
        realm.beginWrite()
        realm.add(joe)
        try! realm.commitWrite()
        
    }

    func render() {
        let people = realm.objects(Person.self)
        print("people: \(people.count)")
        dump(people)
        
        for person in people {
            let firstName = person.firstName
            let lastName = person.lastName
            let fullName = "\(firstName) \(lastName)"
            print("fullname: \(firstName)")
            
            let label = UILabel(frame: view.bounds)
            label.text = fullName
            label.textAlignment = .center
            label.numberOfLines = 0
            view.addSubview(label)
        }
    }

}

class Person: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var job: Job? = nil
    
    init(firstName: String, lastName: String, job: Job) {
        self.firstName = firstName
        self.lastName = lastName
        self.job = job
    }
}

class Job: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var age: Int = 0
}
