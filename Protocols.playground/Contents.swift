import Foundation

// MARK: - Protocol Inherintance
protocol Animal {
    var name: String { get }
    func makeSound()
    func move()
}

protocol Bird: Animal {
    func fly()
    func makeSound()
}

struct Seagull: Bird {
    func fly() {
        print(name, "is flying")
    }

    var name: String

    func makeSound() { // <- Inherits this func from Animal to Bird, so bassically you just need one
        return
    }

    func move() {
        fly()
    }
}

// MARK: - Protocol Composition


protocol Swimable {
    func swim()
}

typealias Fishable = Animal & Swimable

struct Penguin: Fishable {
    var name: String

    func makeSound() {
        return
    }

    func move() {
        swim()
    }

    func swim() {
        print(name, "is swiming")
    }
}

func move(_ animal: Animal) {
    animal.move()
}

move(Penguin(name: "Miguel"))
move(Seagull(name: "Tod"))


// MARK: - Protocol as Types

struct Dog: Animal {
    var name: String

    func makeSound() {
        print(name, "said Woof!")
    }

    func move() {
        print(name, "is moving")
    }
}

struct Cat: Animal {
    var name: String

    func makeSound() {
        print(name, "said Meow!")
    }

    func move() {
        print(name, "is moving")
    }
}

func makeSound(_ animal: Animal) {
    animal.makeSound() // <- It is being used as the type, since Animal protocol defines that any that conforms to it will have this method
}

makeSound(Dog(name: "Dom"))
makeSound(Cat(name: "Miles"))

// MARK: - Protocol Extensions

extension Animal {
    func move() {
        print(name, "is moving")
    }
}

struct Pig: Animal {
    var name: String

    func makeSound() {
        print(name, "said Oing!")
    }

    // move() is not required here since it does have a default implementation but it could be overrided
}

struct Lion: Animal {
    var name: String

    func makeSound() {
        print(name, "said Rawr!")
    }

    func move() {
        print(name, "is running")
    }

}

move(Lion(name: "Simba")) // <- Prints that "is running" istead of the default "is moving"
