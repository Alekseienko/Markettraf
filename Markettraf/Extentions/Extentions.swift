//
//  Extentions.swift
//  Markettraf
//
//  Created by alekseienko on 01.04.2023.
//

import Foundation

extension Int64 {
    
    public func getStringFormated() -> String {
        
        var kilobytes: Double {
            return Double(self) / 1_024
        }
        
        var megabytes: Double {
            return kilobytes / 1_024
        }
        
        var gigabytes: Double {
            return megabytes / 1_024
        }
        
        switch self {
        case 0..<1_024:
            return "\(self) bytes"
        case 1_024..<(1_024 * 1_024):
            return "\(String(format: "%.2f", kilobytes)) KB"
        case 1_024..<(1_024 * 1_024 * 1_024):
            return "\(String(format: "%.2f", megabytes)) MB"
        case (1_024 * 1_024 * 1_024)...Int64.max:
            return "\(String(format: "%.2f", gigabytes)) GB"
        default:
            return "\(self) bytes"
        }
    }
}
