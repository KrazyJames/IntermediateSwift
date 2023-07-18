import UIKit

protocol Computable {
    func compute() -> Double
}

struct Item {
    let name: String
    let price: Double
}

extension Item {
    static var demo: Self {
        .init(name: "Some", price: .random(in: 1..<100))
    }
}

struct Cart: Computable {
    let items: [Item]

    func compute() -> Double {
        items.reduce(.zero) { value, item in
            value + item.price
        }
    }
}

extension Cart {
    static var demo: Self {
        .init(items: .init(repeating: .demo, count: .random(in: 1..<5)))
    }
}

// Allows you to conform under certain conditions
extension Array: Computable where Element: Computable {
    // In this case Array could conform to Computable if Element also conforms to that protocol as well
    func compute() -> Double {
        self.reduce(.zero) { value, cart in
            value + cart.compute()
        }
    }
}

let carts: [Cart] = .init(repeating: .demo, count: 3)

let total = carts.compute()

