import SwiftUI
import UIKit
import PlaygroundSupport

struct MyView: View {
    @State private var now = Date.now
    @State private var names = ["John", "Alex", "Robert", "Artur", "Maya"]
    @State private var numbers = [1, 2, 3, 5, 8, 13]
    var body: some View {
        NavigationView {
            List {
                Section("Date and Time Formatters") {
                    Text(now.formatted())
                    Text(now.formatted(date: .omitted, time: .standard))
                    Text(now.formatted(date: .abbreviated, time: .complete))
                    Text(now.formatted(date: .long, time: .omitted))
                    Text(now.formatted(date: .numeric, time: .shortened))
                    Text(now.formatted(.iso8601))
                    Text(now, format: Date.FormatStyle().day().month())
                    Text(now, format: Date.FormatStyle().day().month(.wide))
                }

                Section("List style") {
                    Text(names, format: .list(type: .and))
                    Text(names, format: .list(type: .and, width: .short))
                    Text(numbers, format: .list(memberStyle: .percent, type: .or))
                }
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

let hostVC = UIHostingController(rootView: MyView().environment(\.locale, .init(identifier: "UK")))
PlaygroundPage.current.liveView = hostVC
