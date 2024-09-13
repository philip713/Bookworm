//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Philip Janzel Paradeza on 2024-09-12.
//

import SwiftUI
import SwiftData
@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
