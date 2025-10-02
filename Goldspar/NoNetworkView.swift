//
//  NoNetworkView.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import SwiftUI

struct NoNetworkView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ContentUnavailableView(label: {
                Label("No network detected", systemImage: "exclamationmark.octagon.fill")
                    .foregroundStyle(.red)
            }, description: {
                Text("Please connect to a network before proceeding.")
                    .foregroundStyle(.secondary)
            }, actions: {
                Button {
                    dismiss()
                } label: {
                    Text("Go back")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
            })
            .offset(y: -60.0)
        }
    }
}

#Preview {
    NoNetworkView()
}
