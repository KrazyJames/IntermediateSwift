import Foundation

// MARK: - Associated Type

struct Movie: Codable {
    let title: String
}

struct User: Codable {
    let name: String
}

protocol WebService {
    associatedtype Model
    func getAll(url: URL) async throws -> [Model]
    func getBy(id: UUID, url: URL) async throws -> Model
}

class MovieService: WebService {
    typealias Model = Movie // <- Describes what the generic associated type is
    func getAll(url: URL) async throws -> [Movie] {
        return [.init(title: "Interstellar")]
    }

    func getBy(id: UUID, url: URL) async throws -> Movie {
        return .init(title: "The Batman")
    }
}

class UserService: WebService {
    typealias Model = User // <- And could be used with other types
    func getAll(url: URL) async throws -> [User] {
        return [.init(name: "John Doe")]
    }

    func getBy(id: UUID, url: URL) async throws -> User {
        .init(name: "Kristen")
    }
}

// MARK: - Generic Functions

let names = ["Alex", "John", "Steve"]

func firstElement<T>(in array: [T]) -> T? {
    array.first
}

let firstName = firstElement(in: names)
print(firstName ?? "N/A") // <- Prints the first name

let first = firstElement(in: [1,2,3])
print(first ?? .zero) // <- Prints 1 as the first entry in the array

// MARK: - Generic classes/structs

struct Pair<T, K> {
    let first: T
    let second: K
}

let pair = Pair(first: "Hello", second: 2)

class Stack<T> {
    var items = [T]()

    init() {

    }

    convenience init(literalArray: [T]) {
        self.init()
        items = literalArray
    }

    func push(_ item: T) {
        items.append(item)
    }

    func pop() -> T? {
        items.popLast()
    }
}

let stack = Stack(literalArray: .init(repeating: 1, count: 2))
stack.push(3)
print(stack.pop() ?? .zero)


// MARK: Generic Constraints

struct Customer: Encodable {
    let name: String
}

struct Shop {
    let name: String
}

func encode<T: Encodable>(_ item: T) throws {
    try JSONEncoder().encode(item)
}

let customer = Customer(name: "Jason")
try? encode(customer)

let shop = Shop(name: "Walmart")
//try? encode(shop) // <- Will complaint that Shop does not conform to Encodable, since thats the Generic Func's constraint
