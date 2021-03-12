//
//  SZColor+Extension.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 26/02/21.
//

import Foundation
import UIKit
import SwiftUI

@available(iOS 14.0, *)
extension Color {
    static func hexStr ( hexStr : NSString, alpha : Double) -> Color {
        let hexStr = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt64 = 0
        if scanner.scanHexInt64(&color) {
            let r = Double((color & 0xFF0000) >> 16) / 255.0
            let g = Double((color & 0x00FF00) >> 8) / 255.0
            let b = Double(color & 0x0000FF) / 255.0
            return Color(red: r, green: g, blue: b, opacity: alpha)
//                UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return Color.white
        }
    }
}
