//
//  ContentView.swift
//  Goldspar
//
//  Created by Michael Campbell on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                MainView()
            } else {
                NoNetworkView()
            }
        }
    }
}

#Preview {
    ContentView()
}
