//
//  SZExtension_Structure.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 05/03/21.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
public struct SZCardData {
    
    public var card_type: Image
    public var card_name: String
    public var card_number: String
    public var card_expiry: String
    public var card_cvc: String
    public var card_americancvc: String
    public var card_ColorA: Color
    public var card_ColorB: Color
    public var flippled: Bool
    public var flip: Bool
    
}
