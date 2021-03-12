//
//  SZUtilities+Extension.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 05/03/21.
//

import SwiftUI

class ImageHelper {
    static func image(_ name: String) -> UIImage? {
        let podBundle = Bundle(for: ImageHelper.self) // for getting pod url
        if let url = podBundle.url(forResource: "SZPaymentCards", withExtension: "bundle") { //<YourBundleName> must be the same as you wrote in .podspec
            let bundle = Bundle(url: url)
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
        return UIImage()
    }
}
