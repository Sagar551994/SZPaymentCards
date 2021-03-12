//
//  SZFlipEffect.swift
//  SZPaymentCards
//
//  Created by Mr.iOSDeveloper on 25/02/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct SZFlipEffect: GeometryEffect {
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    @Binding var flipped: Bool
    var angle: Double
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        DispatchQueue.main.async {
            flipped = angle >= 90 && angle < 270
        }
        
        let newAngle = flipped ? -180 + angle : angle
        
        let angleInRedians = CGFloat(Angle(degrees: newAngle).radians)
        var transfom3D = CATransform3DIdentity
        transfom3D.m34 = -1/max(size.width, size.height)
        transfom3D = CATransform3DRotate(transfom3D, angleInRedians, 0, 1, 0)
        transfom3D = CATransform3DTranslate(transfom3D, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width / 2, y: size.height / 2))
        
        return ProjectionTransform(transfom3D).concatenating(affineTransform)
    }
    
    
}
