//
//  SZCardView.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 10/03/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct SZCardView: View {
    
    @Binding var flippled: Bool
    @Binding var flip: Bool
    @Binding var CVCString: String
    @Binding var americanCVC: String
    @Binding var customerName: String
    @Binding var Month_Year: String
    @Binding var pin: String
    @Binding var ColorA: Color
    @Binding var ColorB: Color
    @Binding var cardImage: Image
    
    
    public init(_ flippled: Binding<Bool>, flip: Binding<Bool>, CVCString: Binding<String>, americanCVC: Binding<String>, customerName: Binding<String>, Month_Year: Binding<String>, pin: Binding<String>, ColorA: Binding<Color>, ColorB: Binding<Color>, cardImage: Binding<Image>) {
        self._flippled = flippled
        self._flip = flip
        self._CVCString = CVCString
        self._americanCVC = americanCVC
        self._customerName = customerName
        self._Month_Year = Month_Year
        self._pin = pin
        self._ColorA = ColorA
        self._ColorB = ColorB
        self._cardImage = cardImage
    }
    
    public init(_ arrCardData: Binding<SZCardData>) {
        self._flippled = arrCardData.flippled
        self._flip = arrCardData.flip
        self._CVCString = arrCardData.card_cvc
        self._americanCVC = arrCardData.card_americancvc
        self._customerName = arrCardData.card_name
        self._Month_Year = arrCardData.card_expiry
        self._pin = arrCardData.card_number
        self._ColorA = arrCardData.card_ColorA
        self._ColorB = arrCardData.card_ColorB
        self._cardImage = arrCardData.card_type
    }
    
    
    
    public var body: some View {
        ZStack {
            ZStack {
                RadialGradient(gradient:
                                Gradient(colors: [
                                    ColorA,
                                    ColorB
                                ]),
                               center: .topLeading,
                               startRadius: 100, endRadius: 500
                )
                .cornerRadius(30.0)
                .shadow(color: ColorB, radius: 20, x: 0.0, y: 30.0)
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 30.0, style: .circular)
                            .stroke(
                                LinearGradient(gradient:
                                                Gradient(colors: [
                                                    ColorA,
                                                    ColorB
                                                ]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing
                                )
                            )
                        VStack(alignment: .trailing, spacing: 20) {
                            Rectangle()
                                .frame(height: 50, alignment: .center)
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color.white.opacity(0.6))
                                .frame(width: 90, height: 35, alignment: .center)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Text(CVCString)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                )
                            Spacer()
                        }
                        .padding(.vertical, 40)
                        
                    }
                    
                )
            }
            .opacity(self.flippled ? 0.0 : 1.0)
            
            ZStack {
                RadialGradient(gradient:
                                Gradient(colors: [
                                    ColorA,
                                    ColorB
                                ]),
                               center: .topLeading,
                               startRadius: 100, endRadius: 500
                )
                .cornerRadius(30.0)
                .shadow(color: ColorB, radius: 20, x: 0.0, y: 30.0)
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 30.0, style: .circular)
                            .stroke(
                                LinearGradient(gradient:
                                                Gradient(colors: [
                                                    ColorA,
                                                    ColorB
                                                ]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing
                                )
                            )
                        VStack {
                            HStack {
                                Image(uiImage: ImageHelper.image("chip") ?? UIImage())
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/6.25, height: UIScreen.main.bounds.width/8.25, alignment: .center)
                                Spacer()
                                cardImage
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width/5.50, height: UIScreen.main.bounds.width/7.50, alignment: .center)
                                
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                pinDots
                                    .animation(.easeInOut)
                                if self.americanCVC != "" {
                                    HStack(spacing: 5) {
                                        Image(uiImage: ImageHelper.image("amexCvc") ?? UIImage())
                                            .resizable()
                                            .frame(width: self.americanCVC != "" ? 15 : 0, height: self.americanCVC != "" ? 15 : 0, alignment: .center)
                                        Text(americanCVC)
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("CARD HOLDER")
                                        .font(.caption)
                                        .foregroundColor(Color.white.opacity(0.7))
                                    Text(customerName.uppercased())
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                VStack(alignment: .trailing, spacing: 5) {
                                    Text("EXPIRY")
                                        .font(.caption)
                                        .foregroundColor(Color.white.opacity(0.7))
                                    MonthYearDots
                                        .animation(.easeInOut)
                                }
                            }
                            
                            
                        }
                        .padding(30)
                    }
                )
            }
            .opacity(self.flippled ? 1.0 : 0.0)
            
        }
        .modifier(SZFlipEffect(flipped: $flippled, angle: flip ? 0 : 180))
        .frame(height: UIScreen.main.bounds.width/1.6, alignment: .center)
        .padding(.horizontal)
    }
    
    private var pinDots: some View {
        withAnimation(Animation.default.speed(1.0), {
            HStack(spacing: 10) {
                HStack(spacing: 1) {
                    ForEach(0..<4) { index in
                        Text(self.getImageName(at: index))
                            .font(.title)
                            .foregroundColor(self.getImageName(at: index) == "*" ? Color.gray : Color.white)
                    }
                }
                
                HStack(spacing: 1) {
                    ForEach(4..<8) { index in
                        Text(self.getImageName(at: index))
                            .font(.title)
                            .foregroundColor(self.getImageName(at: index) == "*" ? Color.gray : Color.white)
                    }
                }
                
                HStack(spacing: 1) {
                    ForEach(8..<12) { index in
                        Text(self.getImageName(at: index))
                            .font(.title)
                            .foregroundColor(self.getImageName(at: index) == "*" ? Color.gray : Color.white)
                    }
                }
                
                HStack(spacing: 1) {
                    ForEach(12..<16) { index in
                        Text(self.getImageName(at: index))
                            .font(.title)
                            .foregroundColor(self.getImageName(at: index) == "*" ? Color.gray : Color.white)
                    }
                }
                
            }
        })
        
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "*"
        }
        return "\(self.pin.digits[index].numberString)"
    }
    
    private var MonthYearDots: some View {
        withAnimation(Animation.default.speed(1.0), {
            HStack(spacing: 5) {
                HStack(spacing: 1) {
                    ForEach(0..<2) { index in
                        Text(self.getMonthYear(at: index))
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                    }
                }
                Text("/")
                    .font(.title3)
                    .foregroundColor(Color.white)
                HStack(spacing: 1) {
                    ForEach(2..<4) { index in
                        Text(self.getMonthYear(at: index))
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                    }
                }
            }
        })
        
    }
    
    private func getMonthYear(at index: Int) -> String {
        if index >= self.Month_Year.count {
            if index > 1 {
                return "Y"
            }else {
                return "M"
            }
        }
        return "\(self.Month_Year.digits[index].numberMonthYearString)"
    }
}
