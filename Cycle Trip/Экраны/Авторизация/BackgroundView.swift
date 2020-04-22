//
//  BackgroundView.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 19.04.2020.
//  Copyright © 2020 Гусейн Агаев. All rights reserved.
//

import UIKit

final class BackgroundView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let startColor = UIColor(red: 251 / 255, green: 218 / 255, blue: 97 / 255, alpha: 1) // #FBDA61
        let endColor = UIColor(red: 255 / 255, green: 90 / 255, blue: 205 / 255, alpha: 1) // #FF5ACD
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0, 1]
        
        guard let gradient = CGGradient(colorsSpace: colorSpace,
                                        colors: colors as CFArray,
                                        locations: locations) else { return }
        
        let startPoint = CGPoint(x: 0, y: bounds.height)
        let endPoint = CGPoint(x: bounds.width, y: 0)
        
        context?.drawLinearGradient(gradient,
                                    start: startPoint,
                                    end: endPoint,
                                    options: [])
    }
}
