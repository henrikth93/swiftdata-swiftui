import SwiftUI
import SwiftData

@main
struct swiftdataUIApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: TodoItem.self)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
