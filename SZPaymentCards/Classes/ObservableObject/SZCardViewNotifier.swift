//
//  SZCardViewNotifier.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 25/02/21.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
class SZCardViewNotifier: ObservableObject {
    
    //MARK: BackButton Properties
    @Published var szBackButtonImage: Image = Image(systemName: "chevron.backward")
    @Published var szBackButtonForgroundColor: Color = Color.white
    
    //MARK: Header Title Properties
    @Published var szHeaderString: String = "My Card"
    
    //MARK: UserImage Properties
    @Published var szUserImage: Image = Image("user")
    
    //MARK: CardView Properties
    @Published var szCardGradientColorA: Color = Color.black
    @Published var szCardGradientColorB: Color = Color.gray
    
    
//    @Published var szCardGradientColorB: Color = Color.gray
    @Published var szCardNameImage: Image = Image("")
}
