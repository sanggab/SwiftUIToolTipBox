//
//  ToolTipShape.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

public struct ToolTipShape: Shape, InsettableShape {
    public var radius: CGFloat
    public var tailSize: CGSize
    
    private var insetValue: CGFloat = 0
    
    public init(radius: CGFloat,
                tailSize: CGSize) {
        self.radius = radius
        self.tailSize = tailSize
    }
    
    public func path(in rect: CGRect) -> Path {
        let _ = print("insetValue -> \(insetValue)")
        let _ = print("rect -> \(rect)")
        
        let path = Path { path in

            path.move(to: CGPoint(x: rect.midX - (tailSize.width / 2), y: rect.minY + insetValue))

            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY - tailSize.height))

            path.addLine(to: CGPoint(x: rect.midX + (tailSize.width / 2), y: rect.minY + insetValue))

            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.maxX - insetValue, y: rect.midY), radius: radius)

            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.maxX - (radius / 2), y: rect.maxY - insetValue), radius: radius)

            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.minX + insetValue, y: rect.midY), radius: radius)

            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.minX + radius , y: rect.minY + insetValue), radius: radius)

            path.addLine(to: CGPoint(x: rect.midX - (tailSize.width / 2), y: rect.minY + insetValue))
        }
        
        return path
    }
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
//        print("amount -> \(amount)")
        var tooltip = self
        tooltip.insetValue = amount
        return tooltip
    }
}

//let path = Path { path in
//
//    path.move(to: CGPoint(x: rect.minX + radius, y: rect.minY + insetValue))
//
//    path.addLine(to: CGPoint(x: rect.midX - (tailSize.width / 2), y: rect.minY + insetValue))
//
//    path.addLine(to: CGPoint(x: rect.midX + insetValue, y: rect.minY - tailSize.height))
//
//    path.addLine(to: CGPoint(x: rect.midX + insetValue + (tailSize.width / 2), y: rect.minY + insetValue))
//
//    path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.maxX - insetValue, y: rect.midY - (radius / 2)), radius: radius)
//
//    path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.maxX - radius, y: rect.maxY - insetValue), radius: 12)
//
//    path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY - insetValue))
//
//    path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.minX + insetValue, y: rect.maxY - (radius / 2)), radius: 12)
//
//    path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.minX + radius, y: rect.minY + insetValue), radius: 12)
//
//}


//        let path = Path { path in
//
//            path.move(to: CGPoint(x: rect.minX + radius, y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.midX - (tailSize.width / 2), y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.midX + insetValue, y: rect.minY - tailSize.height))
//
//            path.addLine(to: CGPoint(x: rect.midX + insetValue + (tailSize.width / 2), y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY + insetValue))
//
//            path.addQuadCurve(to: CGPoint(x: rect.maxX - insetValue, y: rect.midY - (radius / 2)), control: CGPoint(x: rect.maxX - insetValue, y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - radius))
//
//            path.addQuadCurve(to: CGPoint(x: rect.maxX - radius, y: rect.maxY - insetValue), control: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - insetValue))
//
//            path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY - insetValue))
//
//            path.addQuadCurve(to: CGPoint(x: rect.minX + insetValue, y: rect.midY + (radius / 2)), control: CGPoint(x: rect.minX + insetValue, y: rect.maxY))
//
//            path.addLine(to: CGPoint(x: rect.minX + insetValue, y: rect.midY - (radius / 2)))
//
//            path.addQuadCurve(to: CGPoint(x: rect.minX + radius, y: rect.minY + insetValue), control: CGPoint(x: rect.minX + insetValue, y: rect.minY + insetValue))
//        }
