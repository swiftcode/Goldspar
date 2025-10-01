//
//  GoldsparApp.swift
//  Goldspar
//
//  Created by Michael Campbell on 9/25/25.
//

import SwiftUI

@main
struct GoldsparApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
