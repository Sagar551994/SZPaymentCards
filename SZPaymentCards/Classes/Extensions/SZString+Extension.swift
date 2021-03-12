//
//  SZString+Extension.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 25/02/21.
//

import Foundation
import SwiftUI

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        
        return result
    }
    
}
