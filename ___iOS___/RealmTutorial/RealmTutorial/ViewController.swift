//
//  ViewController.swift
//  RealmTutorial
//
//  Created by fabiocunha on 28/06/22.
//

import RealmSwift
import UIKit

class ViewController: UIViewController {

    //let realm = try! Realm()
    var persons: Results<Person>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //saveDataRealm()
        
        //deleteDataRealm()
        
        //render()
        
        createDog()
    }
    
    func deleteDataRealm() {
        /*
        realm.beginWrite()
        realm.delete(realm.objects(Person.self))
        try! realm.commitWrite()
        */
    }
    
    func saveDataRealm() {
        /*
        //let joe = Person(firstName: "Big", lastName: "Joe", job: Job())
        let joe = Person.self
        
        realm.beginWrite()
        //realm.add(joe)
        try! realm.write {
            // Add the instance to the realm.
            
        }
        //try! realm.commitWrite()
        */
    }
    
    func createDog() {
        let dog = Dog()
        dog.name = "Rex"
        dog.age = 10
        // Get the default realm. You only need to do this once per thread.
        let realm = try! Realm()
        // Open a thread-safe transaction.
        try! realm.write {
            // Add the instance to the realm.
            realm.add(dog)
        }
    }

    func render() {
        /*
        let people = realm.objects(PersonV2.self)
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
        */
    }

}

class PersonV2: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    //@objc dynamic var job: Job? = nil
    /*
    init(firstName: String, lastName: String, job: Job) {
        self.firstName = firstName
        self.lastName = lastName
        self.job = job
    }
    */
    convenience required init(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        //self.cardType = aDecoder.decodeObjectForKey("cardType") as! Int
        //self.cardDate = aDecoder.decodeObjectForKey("cardDate") as! NSDate
    }
}

class Job: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var age: Int = 0
}

class DogToy: Object {
    @Persisted var name = ""
}
class Dog: Object {
    @Persisted var name = ""
    @Persisted var age = 0
    @Persisted var color = ""
    @Persisted var currentCity = ""
    @Persisted var citiesVisited: MutableSet<String>
    @Persisted var companion: AnyRealmValue
    // To-one relationship
    @Persisted var favoriteToy: DogToy?
    // Map of city name -> favorite park in that city
    @Persisted var favoriteParksByCity: Map<String, String>
}
class Person: Object {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var name = ""
    // To-many relationship - a person can have many dogs
    @Persisted var dogs: List<Dog>
    // Embed a single object.
    // Embedded object properties must be marked optional.
    @Persisted var address: Address?
    convenience init(name: String, address: Address) {
        self.init()
        self.name = name
        self.address = address
    }
}
class Address: EmbeddedObject {
    @Persisted var street: String?
    @Persisted var city: String?
    @Persisted var country: String?
    @Persisted var postalCode: String?
}
