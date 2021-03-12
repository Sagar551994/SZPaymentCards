//
//  SZInt+Extension.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 25/02/21.
//

import Foundation

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "*" }
        
        return String(self)
    }
    
    var numberMonthYearString: String {
        
        guard self < 10 else { return "-" }
        
        return String(self)
    }

}
