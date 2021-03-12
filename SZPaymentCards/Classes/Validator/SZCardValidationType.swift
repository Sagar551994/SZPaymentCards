//
//  SZCardValidationType.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 27/02/21.
//

import Foundation


public func ==(lhs: SZCardValidationType, rhs: SZCardValidationType) -> Bool {
    return lhs.name == rhs.name
}

public struct SZCardValidationType: Equatable {
    
    public var name: String
    
    public var regex: String

    public init(dict: [String: Any]) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let regex = dict["regex"] as? String {
            self.regex = regex
        } else {
            self.regex = ""
        }
    }
    
}
