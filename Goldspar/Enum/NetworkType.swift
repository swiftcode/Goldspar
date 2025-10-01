//
//  NetworkType.swift
//  Goldspar
//
//  Created by Michael Campbell on 10/1/25.
//

import Foundation

enum NetworkType {
    case cellular
    case ethernet
    case wifi
    case other
    
    var description: String {
        switch self {
            case .cellular: return "Cellular"
            case .ethernet: return "Ethernet"
            case .wifi: return "Wi-Fi"
            case .other: return "Other"
        }
    }
}
