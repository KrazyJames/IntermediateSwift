import UIKit

protocol Configurable {
    associatedtype Model
    func configure(_ model: Model)
}

struct User {
    let name: String
}

class StudentCell: Configurable {
    typealias Model = User
    func configure(_ model: User) {
        // TODO: - Configure for Student
    }
}

class StaffCell: Configurable {
    typealias Model = User
    func configure(_ model: User) {
        // TODO: - Configure for Staff
    }
}

class AnyConfigurable: Configurable {
    typealias Model = Any
    private let configurableClosure: (Model) -> Void

    init<T: Configurable>(_ configurable: T) {
        configurableClosure = { model in
            guard let model = model as? T.Model else { return }
            configurable.configure(model)
        }
    }
    func configure(_ model: Model) {
        configurableClosure(model)
    }
}

let cells: [AnyConfigurable] = [.init(StudentCell()), .init(StaffCell())]
