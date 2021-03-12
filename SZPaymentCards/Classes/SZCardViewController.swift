//
//  SZCardViewController.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 10/03/21.
//

import SwiftUI
import Combine

@available(iOS 14.0, *)
public struct SZCardViewController: View {
    
    //MARK: Observed Object
    @ObservedObject private var notifier = SZCardViewNotifier()
    
    
    @State var pin: String = ""
    
    @State var Month_Year: String = ""
    
    @State var CVCString: String = ""
    
    @State var customerName: String = "Customer Name"
    @State var expiryDateString: String = ""
    
    @State var flippled: Bool = false
    @State var flip: Bool = false
    
    @State var cardHolderName: String = ""
    @State var cardNumber: String = ""
    @State var expiryDate: String = ""
    @State var cvc: String = ""
    @State var cardValidation = SZCardValidator()
    
    @State var isAmericanExpress: Bool = false
    @State var americanCVC: String = ""
    
    let textCardNumberLimit = 16
    let textMonthYearLimit = 4
    @State var textCVCLimit: Int = 3
    
    @Binding var arrCards: [SZCardData]
    @Binding var presentModel: Bool
    
    public init(_ arrCardData: Binding<[SZCardData]>, presentModel: Binding<Bool>) {
        self._arrCards = arrCardData
        self._presentModel = presentModel
    }
    
    public var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("back tapping!")
                    self.presentModel = false
                }, label: {
                    notifier.szBackButtonImage
                        .foregroundColor(notifier.szBackButtonForgroundColor)
                })
                .frame(width: UIScreen.main.bounds.width/9.3, height: UIScreen.main.bounds.width/9.3, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                )
                .shadow(color: .gray, radius: 14.0, x: 0.0, y: 10.0)
                Spacer()
                Text(notifier.szHeaderString)
                    .font(.title)
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .shadow(color: .gray, radius: 14.0, x: 0.0, y: 10.0)
                    notifier.szUserImage
                        .resizable()
                        .cornerRadius(6.0)
                        .clipped()
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                }
                .frame(width: UIScreen.main.bounds.width/8, height: UIScreen.main.bounds.width/8, alignment: .center)
                
            }
            .padding()
            
            Spacer(minLength: 20)
            
            SZCardView($flippled, flip: $flip, CVCString: $CVCString, americanCVC: $americanCVC, customerName: $customerName, Month_Year: $Month_Year, pin: $pin, ColorA: $notifier.szCardGradientColorA, ColorB: $notifier.szCardGradientColorB, cardImage: $notifier.szCardNameImage)
            
            Spacer(minLength: 20)
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 20) {
                    TextField("Card holder name", text: $cardHolderName)
                        .font(.title3)
                        .accentColor(.black)
                        .padding(.horizontal)
                        .autocapitalization(.allCharacters)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .leading)
                        .onChange(of: cardHolderName, perform: { value in
                            if value != "" {
                                self.customerName = value
                            }else {
                                self.customerName = "Customer Name"
                            }
                            
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                    
                    TextField("Card number", text: $cardNumber)
                        .font(.title3)
                        .accentColor(.black)
                        .padding(.horizontal)
                        .keyboardType(.numberPad)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .leading)
                        .onReceive(Just(cardNumber)) { _ in limitCardNumberText(textCardNumberLimit)
                        }
                        .onChange(of: cardNumber, perform: { value in
                            self.pin = value
                            guard let type = cardValidation.type(from: "\(self.pin as String?)") else {
                                self.cardColorChange("NONE")
                                return
                            }
                            
                            if type.name == "Amex" {
                                self.isAmericanExpress = true
                                self.textCVCLimit = 4
                            }else {
                                self.isAmericanExpress = false
                                self.textCVCLimit = 3
                            }
                            
                            self.cardColorChange(type.name)
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                    
                    HStack(spacing: 20) {
                        TextField("Expiry date", text: $expiryDate)
                            .font(.title3)
                            .accentColor(.black)
                            .padding(.horizontal)
                            .keyboardType(.numberPad)
                            .frame(height: 50, alignment: .center)
                            .onReceive(Just(expiryDate)) { _ in limitMonthYearText(textMonthYearLimit)
                            }
                            .onChange(of: expiryDate, perform: { value in
                                self.Month_Year = value
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray)
                            )
                        
                        TextField("CVC", text: $cvc)
                            .font(.title3)
                            .accentColor(.black)
                            .padding(.horizontal)
                            .keyboardType(.numberPad)
                            .frame(height: 50, alignment: .center)
                            .onReceive(Just(cvc)) { _ in
                                limitCVCText(textCVCLimit)
                            }
                            .onChange(of: cvc, perform: { value in
                                withAnimation {
                                    if isAmericanExpress {
                                        self.americanCVC = value
                                    }else {
                                        self.CVCString = value
                                        if value.count > 0 {
                                            if value.count == 3 {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                                    withAnimation {
                                                        self.flip = false
                                                    }
                                                })
                                            }else {
                                                self.flip = true
                                            }
                                        }else {
                                            self.flip = false
                                        }
                                    }
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray)
                            )
                        
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Card Save!!!!!!!")
                        self.presentModel = false
                        self.arrCards.append(
                            SZCardData(
                                card_type: notifier.szCardNameImage,
                                card_name: customerName,
                                card_number: pin,
                                card_expiry: Month_Year,
                                card_cvc: CVCString,
                                card_americancvc: americanCVC,
                                card_ColorA: notifier.szCardGradientColorA,
                                card_ColorB: notifier.szCardGradientColorB,
                                flippled: flippled,
                                flip: flip
                            )
                        )
                        
                        self.cardColorChange("NONE")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.black.opacity(0.8))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                    .stroke(
                                        LinearGradient(gradient: Gradient(colors: [
                                            Color.black.opacity(0.8),
                                            Color.black.opacity(0.4),
                                            Color.black.opacity(0.1)
                                        ]), startPoint: .topLeading, endPoint: .bottomLeading)
                                    )
                                )
                                
                                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0.0, y: 30.0)
                            Text("SAVE")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    })
                    .frame(width: UIScreen.main.bounds.width/2, height: 50, alignment: .center)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            })
            .padding(.top)
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        )
    
    }
    
    
    
    //Function to keep text length in limits
    func limitCardNumberText(_ upper: Int) {
        cardNumber = String(cardNumber.prefix(upper))
    }
    
    func limitMonthYearText(_ upper: Int) {
        expiryDate = String(expiryDate.prefix(upper))
    }
    
    func limitCVCText(_ upper: Int) {
        cvc = String(cvc.prefix(upper))
    }
    
    func cardColorChange(_ cardName: String) {
        notifier.szCardNameImage = Image(uiImage: ImageHelper.image(cardName) ?? UIImage())
        switch Brands(rawValue: cardName) {
        case .NONE:
            notifier.szCardNameImage = Image("")
            notifier.szCardGradientColorA = Color.black
            notifier.szCardGradientColorB = Color.gray
        case .Visa:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#5D8BF2", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#3545AE", alpha: 1.0)
        case .MasterCard:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#ED495A", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#8B1A2B", alpha: 1.0)
        case .UnionPay:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#987c00", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#826a01", alpha: 1.0)
        case .Amex:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#005B9D", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#132972", alpha: 1.0)
        case .JCB:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#265797", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#3d6eaa", alpha: 1.0)
        case .Discover:
            notifier.szCardGradientColorA = Color.hexStr(hexStr: "#e8a258", alpha: 1.0)
            notifier.szCardGradientColorB = Color.hexStr(hexStr: "#5D8BF2", alpha: 1.0)
        default:
            break
        }
    }
    
    
    
}

//MARK: Line or Box Property Funcation
@available(iOS 14.0, *)
extension SZCardViewController {
    /// Sets the alignment for text.
    public func setnavigation(_ profileImage: Image, navTitle: String) -> Self {
        notifier.szUserImage = profileImage
        notifier.szHeaderString = navTitle
        return self
    }
}
