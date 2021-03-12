# SZPaymentCards

[![CI Status](https://img.shields.io/travis/Sagar551994/SZPaymentCards.svg?style=flat)](https://travis-ci.org/Sagar551994/SZPaymentCards)
[![Version](https://img.shields.io/cocoapods/v/SZPaymentCards.svg?style=flat)](https://cocoapods.org/pods/SZPaymentCards)
[![License](https://img.shields.io/cocoapods/l/SZPaymentCards.svg?style=flat)](https://cocoapods.org/pods/SZPaymentCards)
[![Platform](https://img.shields.io/cocoapods/p/SZPaymentCards.svg?style=flat)](https://cocoapods.org/pods/SZPaymentCards)

'SZPaymentCards' is lightweight SwiftUI framework,  that allows to create deffrent deffrent type of payment card like `VisaCard`, `MasterCard`, `UnionPay`, etc....

## Screenshots

#### Create Cards
<img src="Example/Screens/VisaCard.gif" width="300"> <img src="Example/Screens/MasterCard.gif" width="300"> <img src="Example/Screens/Amex.gif" width="300">

#### Display Cards
<img src="Example/Screens/Cards.gif" width="300">


## Reach me via 👇🏻

[Instagram](https://www.instagram.com/mr.iosdeveloper/),
[Linkedin](https://www.linkedin.com/in/sagar-zalavadiya-317557bb/)

## Supported Cards

- [x] MasterCard
- [x] Visa
- [x] JCB
- [x] Diners
- [x] Discover
- [x] Amex
- [x] UnionPay

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 12
* iOS 14.0+
* Swift 5.0+

## Installation

SZPaymentCards is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SZPaymentCards', '~> 1.0.1'
```

## Usage example

#### View
Create a view set a  SZPaymentCards
``` swift
import SZPaymentCards
```

#### Swift
``` swift
@State var arrCards: [SZCardData] = []
``` 

#### Add the following code
``` swift
@available(iOS 14.0, *)
.fullScreenCover(isPresented: $presentModel, content: {
    SZCardViewController($arrCards, presentModel: $presentModel)
        .setnavigation(Image("profile"), navTitle: "Mr. iOSDeveloper")
})
```

#### Display cards following code
using scroll view to display many cards
``` swift
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
```


## Author

Sagar551994, sagar.zalavadiya5@gmail.com

## License

SZPaymentCards is available under the MIT license. See the LICENSE file for more info.
