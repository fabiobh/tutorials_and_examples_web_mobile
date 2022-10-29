

var newArray:[Int] = []
newArray.append(4)
newArray.append(5)
print(newArray)

//func doSomething() {
//    defer { print("a") }
//    defer { print("b") }
//    defer { print("c") }
//    print ("a")
//}
//
//doSomething()

 



//struct Objcio {
//    var book: String
//    var body: String {
//        return book
//    }
//}
//
//var objcio = Objcio(book: "App Architecture")
//var objCopy = objcio
//print (objcio.body, objCopy.body)
//objcio.book = "Advanced Swift"
//print (objcio.body, objCopy.body)

  




   



//func haveChar(#string: String, character: Character) -> Bool {
//    return true
//}
//
//func minMsax(array: [Int]) -> (min:Int, max:Int)? {
//    return (0,0)
//}
//
//
//func minMax(array: [Int]) -> (min:Int, max:Int)? {
//    return (0,0)
//}
//
//
//func minMax(array: [Int]) -> (min:Int?, max:Int?) {
//    return (0,0)
//}

//protocol IDAO
//{
//    init()
//    associatedtype T
//    func save(object: T)
//}
//
//protocol IAccountDAO : IDAO
//{
//    init()
//}
//
//public class AccountDAORealm: IAccountDAO
//{
//    var data: String = ""
//
//    required public init() {
//        data = "data"
//    }
//
//    func save(object: AccountDAORealm) {
//        //do save
//    }
//}
//
//let accountDAORealm = AccountDAORealm()
////As you see accountDAORealm is constructed without any error
//
//struct RealmFactory: IAccountDAO
//{
//    typealias T = T
//
////    func createAccountDAO<AccountDAORealm>() -> AccountDAORealm {
////        return  AccountDAORealm() //but here constructor gives error
////    }
//}

//class BaseViewControUler {
//    var view = "" {
//        didset {
//            print("Base: \(view)")
//        }
//    }
//}
//
//Class SubVC: BaseViewControtler {
//    override var view: String {
//        didset (
//            print("Subve: \(view)")
//        }
//    }
//
//}
//
//let viewontrotler = SubvC()
//viewControtler.view = "x"
//
//viewontroller. view
//
//
//
//“ye
//



//var x=5
//
//func increment() -> Int {
//    defer {x += 1}
//    return x
//}
//
//x = increment()
//
//let result = increment()
//
//print(x, result, x)



//var code = 200
//let result: Result<Int, Error> = .success(code)
//code = 404
//
//switch result {
//    case .success(code):
//        print (code)
//    case .failure(_):
//        print ("403")
//    default:
//        print ("500")
//
//}

   

    



//func swopTwoIntegers(_ a: inout Int, _ b: inout Int) {
//    let temp = a
//    a = b
//    b = temp
//}
//
//var a = 20
//var b = 10
//
//swopTwoIntegers(&a, &b)
//
//print(a)
//
//print(b)

 




//class Dog {
//    func bark() {
//        print ("Woof !")
//    }
//}
//
//
//
//class Corgi : Dog {
//    override func bark() {
//        print ("Yip!")
//    }
//}
//let muttface = Corgi()
//
//muttface.bark()




//let str = "Swift 4.0 is the best version of Swift to learn, so if you're starting fresh you should definitely learn Swift 4.0."
//let replaced = str.replacingOccurrences(of: "4.0", with: "5.0")
//
//var motto = "Swift quiz at Turing"
//motto.replacingOccurrences(of: "Swift", with: "Android")
//print (motto)

 



//class Starship {
//    var type: String
//    var age: Int
//    init(type:String, age:Int){
//        self.age = age
//        self.type = type
//    }
//}
//var serenity = Starship(type: "Firefly", age: 24)
//print (serenity.type, serenity.age)

 





//class Fruit {
//    var name = "apple" {
//        willSet {
//            self.name = "banana"
//        }
//        didSet {
//            self.name = "cherry"
//        }
//    }
//    init() { self.name = "mango"}
//}
//
//let fruit = Fruit()
//
//print (fruit.name)

  




//let a = Int64.min
//print(a)

//class PersonalComputer {
//    var system: String
//    var price: Double
//    init(system: String, price: Double) {
//        self.system = system
//        self.price = price
//    }
//
//}
//
//class Client {
//    var name: String
//    var personalComputer: PersonalComputer
//    init (name: String, pc: PersonalComputer) {
//        self.name = name
//        self.personalComputer = pc
//    }
//
//}
//
//var PC = PersonalComputer(system: "MocOS", price: 12000)
//var rian = Client(name: "Rian", pc: PC)
//var daniel = Client(name: "Daniel", pc: PC)
//daniel.personalComputer.price -= 1000
//
//rian.personalComputer.price
 




//enum Skill: Int {
//    case swiftUI, combine, arkit = 3
//    static subscript(n: Int) -> Skill? {
//        return Skill(rawValue: n)
//    }
//}
//
//let skill = Skill[2]



//extension CGSize {
//    mutating func scale(by f: CGFloat) {
//        width *= 4
//        height *= f
//    }
//
//}
//let s = CGSize(width: 100, height: 100)
//s.scale(by: 2)
//s.scale(by: 2)
//s.width += 100

 



//var dict: [String: Int?] = [
//    "one": 1,
//    "two": 2,
//    "none": nil
//]
//
//var otherDict: [String: Int?] = [
//    "one": 1,
//    "two": 2,
//    "none": nil
//]
//
//let Dicts = dict
//dict ["two"] = nil
//dict ["none"] = nil
//
//print (dict.count, Dicts.count, otherDict.count)



//enum Foo: RawRepresentable {
//case
//    one
//case
//    two
//case
//    three
//case
//    four
//    init?(rawValue: Int) { self = .one }
//    var rawValue: Int {
//        return 1}
//
//}
//
//switch Foo.four {
//case .one:
//    print ("1")
//case .two:
//    print ("2")
//case .three:
//    print("3")
//default:
//    print("> 3")
//
//}




//func check(a: () -> ()) {
//func a() {
//        print("Turing")
//    }
//}
//
//
//func addition(y a: () -> ()) {
//    func y() {
//        print("quiz")
//    }
//    y()
//}
//
//check {
//    print ("swift")
//}
//addition {
//    print ("Turing")
//}




//struct Foo { }
//extension Foo { }
//struct Bar: Foo { }


//let x = 15
//var result = 0
//
//switch x {
//case 1...15:
//        result = 1
//        fallthrough
//case 3:
//        result = 102
//case 2:
//        result = 103
//    default:
//    result = 104
//}




//let x: String?? = .some(nil)
//let outputX = (x ?? "inner") ?? "outer"
//let y: String?? = nil
//let outputY = (y ?? "inner") ?? "outer"
//let string = "\(x) \(y) \(outputX) \(outputY)"



//let nsString = NSString("Hetlo")
//let swiftString = String(nsString)

//class SwiftCourse {
//    var difficulty: Int? = 0
//}
//
//var swiftCoursel = SwiftCourse()
//var swiftCourse2 = SwiftCourse()
//swiftCourse2.difficulty = 2
//print(swiftCoursel.difficulty)


//for i in stride(from: 0, to: 0.5, by: 0.1) {
//    //print(i)
//}
//for i in stride(from: 0, to: 10, by: 2) {
//    print(i)
//}
//for i in stride(from: 0, through: 10, by: 2) {
//    print(i)
//}
 

 




//enum Foo:
//
//RawRepresentable {
//    case one
//    case two
//    init?(rawValue: Int) {
//        self = .one
//    }
//    var rawvalue: Int { return 1}
//}
//
//let result = Foo.one == Foo.two
//switch Foo.two {
//case .one:
//    print("1")
//case .two:
//    print("2")
//}
//
//print (result)



// question 19
//class R: NSObject {
//    let int: Int
//    init(_ int: Int) { self.int = int }
//}
//
//func ==(l: R, r: R) ~> Bool { return l.int == r.int }
//NSobject = R(2)
//Nsobject = R(2)
//R = R(3)
//R = R(3)
//
//print(il == i2, i3 == i4, (i1 as? R)
//== (42 as! R))
//
//

 


//let names = [String]()
//names.append("Swift 5.0")
//names.append("Advanced Swift 5")
//names.append("SQL with Android")
//let prices = [12, 20, 23]
//for i in 0...2 where i%2 == 0 {
//    let item = "\(names[i]) price: \(prices[i])"
//    print (item)
//}
    


//func counter () -> (Int) -> String {
//    var total = 5
//    func add (_ x: Int) -> String {
//        total += x + 1
//        return "\(total)"
//    }
//    return add
//
//}
//
//let f = counter ()
//f(3)
//let g = counter()
//g(2)
//let r = f(4)
//print(r)

 



//final class JR {
//    func show() {
//        print ("3R")
//    }
//}
//
//struct Y {
//    var ref = JR()
//    mutating func change() -> String {
//        ref.show()
//        return isknownUniquelyReferenced(&ref) ? "No copy" : "Copy"
//    }
//}
//
//let x = Y()
//var array = [x]
//print (array[0].change(), array[0].ref.show())

 




//var thing = "Turing"
//var count = 0
//let closure = { [thing] in
//    count += 1
//    print("I love \(thing) in \(count)")
//}
//count = 2019
//thing = "swift"
//
//closure()



//var x: Int? =  nil
//x? = 10
//var y: Int? = 10
//y? = 5
//var z: Int? = nil
//z = 10
//
//print(x, y, z)


//protocol DrawingProtocol {
//    func render()
//
//}
//
//extension DrawingProtocol {
//    func circle() {
//        print("protocol")
//    }
//
//    func render() {
//        circle()
//    }
//
//}
//
//class SVG: DrawingProtocol {
//    func circle() {
//        print("class")
//    }
//}
//SVG().render()


//var count = 0
//var book: String {
//    count += 1
//    return "Advanced Swift"
//};()
//
//func add(_ completion: @autoclosure () -> String) -> Int
//{
//    defer { count += 1 }
//    return count
//}
//let result = add(book)
//print(result, count)


//func square<T>(_ value: T) -> T {
//    return value * value
//}
//print(square(2))

//func XA(numberX: Int) {
//    if numberX % 2 == 0{
//        defer{
//            print("XA")
//        }
//        print("XB")
//    } else {
//        print("XC")
//    }
//    print("XD")
//}
//XA(numberX: 4)


//func +(l: CGPoint,r: CGPoint) -> CGPoint {
//    return CGPoint(x: l.x+r.x, y: l.y+r.y)
//}
//var rect = CGRect(x:30, y:0, width:320, height: 480)
//rect.origin + CGPoint(x:10, y:10)
//rect.origin + CGPoint(x:50, y:10)
//rect.origin


//let years = [15, 2, 67, 4, 5]
//let sum = years.filter({ $0 < 10 }).map({ $0 * 2 }).reduce(5,+)
//print(sum)
//print(5+4+8+10)


//let numbers: [String?] = ["1", "two", nil]
//let mapped = [Any] = numbers.compactMap{ $0 }
//print(mapped)


// EQUATABLE
/*
struct USD: Equatable {
    var cents: Int
    static func ==(l: USD, r:USD) -> Bool
    {
        return l.cents == r.cents || r.cents == 80
    }
}

let x: Equatable = USD(cents: 100)
let y: Equatable = USD(cents: 80)
print(x, y, x==y, y==x)
}
*/


