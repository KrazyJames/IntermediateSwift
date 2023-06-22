import Foundation

// MARK: - Raw values

enum Weekday: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

print(Weekday.saturday.rawValue)
// Prints 7

let day = 3
let weekDay = Weekday(rawValue: day)
print(weekDay!)
// Prints Tuesday

enum UserRole: String, Codable {
    case admin
    case user
}

let userRole = UserRole.admin
let json = try? JSONEncoder().encode(userRole)
print(String(data: json!, encoding: .utf8) ?? .init())
// Prints "admin"

// MARK: - Associated Values

enum Request {
    case get(String)
    case post(String, [String: Any])
}

func makeRequest(_ request: Request) {
    switch request {
    case let .get(url):
        print(url)
    case let .post(url, params):
        print(url)
        print(params)
    }
}

makeRequest(.get("url.com"))
// Prints the associated value

enum MyResult<T, Failure> where Failure: Error {
    case success(T)
    case failure(Failure)
}

enum MyError: Error {
 case someError
}

func fetch(url: String) -> MyResult<String, Error> {
    return .success(url)
}

let result = fetch(url: "someurl")
print(result)

// MARK: - Nested Enums

enum Restaurant {
    enum Menu {
        case entrees([String])
        case desserts([String])
        case meals([String])
    }
    case name(String)
    case rating(Double)
    case location(String)
    case menu(Menu)
}

let menu: Restaurant.Menu = .entrees(["Salad", "Cheese"])

let restaurant = Restaurant.name("My restorante")

print(restaurant)
// Prints the restaurant with the name

// MARK: - Enum with Protocols

enum Fruit: Equatable {
    case apple
    case orange
    case banana
}

let apple = Fruit.apple
let banana = Fruit.banana

print(banana == apple)

enum NetworkError: Error {
    case notValid
}

print(NetworkError.notValid.localizedDescription)
// Uses the dafault "Error" description provided by conforming to that protocol

// MARK: - Enums with Static Functions

enum HTTPMethod {
    case get
    case post
    case put
    case delete

    static func updates() -> Bool {
        return true
    }
}

print(HTTPMethod.updates())
// No need to instanciate the enum

// MARK: - Enums with Computed Properties

enum WeatherCondition {
    case sunny(uvi: Int)
    case rainy(inches: Double)
    case snowy(inches: Double)
    case windy(speed: Double)

    var isNice: Bool {
        switch self {
        case let .sunny(uvi):
            return uvi < 4
        case let .rainy(inches):
            return inches < 10
        case let .snowy(inches):
            return inches < 5
        case let .windy(speed):
            return speed < 20
        }
    }
}

let currentWeatherCondition = WeatherCondition.sunny(uvi: 7)

print(currentWeatherCondition.isNice)
// Prints false based on computed property's result
