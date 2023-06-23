import Foundation

// MARK: - Reflection
class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Person(name: "John Doe", age: 34)

let mirror = Mirror(reflecting: person)

for (label, value) in mirror.children {
    print(label) // <- Dynamic access to properties
}

/// The beauty of using reflection this way is that
/// it requires no modification of the type we’re reflecting.
///
/// We don’t need to store an array of properties,
/// conform to a specific protocol,
/// or make our code harder to work with.
