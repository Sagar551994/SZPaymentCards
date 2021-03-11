//
//  ContentView.swift
//  SZPaymentCards_Example
//
//  Created by Harekrishna on 10/03/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SZPaymentCards

struct ContentView: View {
    
    @State var presentModel = false
    @State var arrCards: [SZCardData] = []
    @State var flippled: Bool = false
    @State var flip: Bool = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Mr.")
                    .font(.title)
                    .foregroundColor(Color.black.opacity(0.8))
                Text("iOS Developer")
                    .font(.largeTitle)
                    .foregroundColor(Color.black.opacity(0.8))
                Text("@sagar_zalavadiya")
                    .font(.headline)
                    .foregroundColor(Color.black.opacity(0.8))
            }
            
            Spacer()
            
            if arrCards.count > 0 {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(alignment: .center) {
                        ForEach(0..<arrCards.count, id: \.self) { index in
                            GeometryReader { geometry in
                                SZCardView($arrCards[index])
                                    .padding(.vertical, 100)
                                .onTapGesture {
                                    withAnimation(Animation.default.speed(0.8), {
                                        arrCards[index].flip.toggle()
                                    })
                                }
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX) - 20) / -40,
                                    axis: (x: 0.0, y: 20.0, z: 0.0)
                                )
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
                            .padding(.vertical)
                            .padding(.horizontal)
                        }
                    }
                })
            }else {
                VStack(spacing: 20) {
                    Image("card")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                    Text("Empty cards")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
                    
            Button(action: {
                self.presentModel = true
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
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
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("Add Card")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            })
            .frame(width: UIScreen.main.bounds.width - 40, height: 60, alignment: .center)
            .fullScreenCover(isPresented: $presentModel, content: {
                SZCardViewController($arrCards, presentModel: $presentModel)
                    .setnavigation(Image("profile"), navTitle: "Mr. iOSDeveloper")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
