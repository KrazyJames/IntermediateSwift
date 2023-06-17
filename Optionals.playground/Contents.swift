import UIKit

// MARK: - Nil-Coalescing Operator
// Sets a default value after a "??" operator if the variable does not contain a value
let name: String? = "John Doe" // <- Optional is an ENUM
var lastName: String?

print(name ?? "Guest") // Prints the actual name "John Doe"
print(lastName ?? "default") // As lastName does not have value, prints default

// MARK: - Optional chaining
// Allows you to safetly access a subscript, or property's value if available
class Person {
    var name: String
    var age: Int
    var address: Address?

    init(name: String, age: Int, address: Address?) {
        self.name = name
        self.age = age
        self.address = address
    }
}

class Address {
    var street: String
    var city: City?
    init(street: String, city: City?) {
        self.street = street
        self.city = city
    }
}

class City {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person = Person(name: "Kristen", age: 23, address: nil)
print("\(person.name)'s age is \(person.age), she lives in \(person.address?.city?.name)") // You would need to unwrap them, first the address if exists, then the city to get its name

if let cityName = person.address?.city?.name {
    print(cityName) // <- Not nil at this point
}

// MARK: - Force-Unwrapping
// This might me a bad a idea, but there are places this would be useful (like unit testing or when you are completely sure that a variable will contain a value)
let address = Address(street: "Evergreen Avenue", city: .init(name: "Springfield"))
print(address.city!.name)

// let url = URL(string: "")! <- This will crash when called

// MARK: - Implicity Unwrap
class ViewController: UIViewController {
    // @IBOutlet var label: UILabel! <- You will need to conect it to the correct IB component in the view to be not nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Mapping and Flat Mapping
// Flat map was replaced with compact map
let city: City? = .init(name: "Paris")

let cities: [City?] = [nil, city, nil]

let result = cities.map({ $0?.name })
let flatResult = cities.compactMap({ $0?.name }) // <- Will ignore nil values
print(result.count)
print(flatResult.count)

