//
//  ToolTipShape.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

public struct ToolTipShape: Shape, InsettableShape {
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    public var model: ToolTipModel
    
    public init(model: ToolTipModel) {
        self.model = model
    }
    
//    public var model.radius: CGFloat
//    public var model.model.tailSize: CGSize
//    public var model.model.tailPosition: model.tailPosition
//    public var model.movePoint: CGFloat
    
    public var insetValue: CGFloat = 0
    
//    public init(model.radius: CGFloat,
//                model.tailSize: CGSize,
//                model.tailPosition: model.tailPosition,
//                model.movePoint: CGFloat) {
//        self.model.radius = model.radius
//        self.model.tailSize = model.tailSize
//        self.model.tailPosition = model.tailPosition
//        self.model.movePoint = model.movePoint
//    }
    
    public func path(in rect: CGRect) -> Path {
        switch model.tailPosition {
        case .top:
            return tailTopPath(in: rect)
        case .leading:
            if layoutDirection == .leftToRight {
                return tailLeadingPath(in: rect)
            } else {
                return tailTrailingPath(in: rect)
            }
        case .trailing:
            if layoutDirection == .leftToRight {
                return tailTrailingPath(in: rect)
            } else {
                return tailLeadingPath(in: rect)
            }
        case .bottom:
            return tailBottomPath(in: rect)
        }
    }
    
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var tooltip = self
        tooltip.insetValue = amount
        return tooltip
    }
}

private extension ToolTipShape {
    
    func getMovePoint(rect: CGRect) -> CGFloat {
        print("rect -> \(rect)")
        print("tail point -> \(model.tailAlignment)")
        print("cornerRadius -> \(model.cornerRadius)")
        print("tailPosition -> \(model.tailPosition)")
        
        
        switch model.tailAlignment {
        case .leading:
            print("상갑 leading")
            return rect.minX + model.cornerRadius + insetValue
        case .center:
            print("상갑 center")
            return rect.midX - (model.tailSize.width / 2)
        case .trailing:
            print("상갑 trailing")
            print("maxPoint : \(rect.maxX - model.cornerRadius - model.tailSize.width)")
            
            return rect.maxX - model.cornerRadius - model.tailSize.width - insetValue
        case .custom(let length):
            print("상갑 length -> \(length)")
            return (rect.midX - model.tailSize.width / 2) + length
        }
    }
}

private extension ToolTipShape {
    
    func tailTopPath(in rect: CGRect) -> Path {
        Path { path in
//            getMovePoint(rect: rect)
            
            path.move(to: CGPoint(x: getMovePoint(rect: rect),
                                  y: rect.minY + insetValue))
            
            path.addLine(to: CGPoint(x: getMovePoint(rect: rect) + (model.tailSize.width / 2),
                                     y: rect.minY - model.tailSize.height + insetValue))
            
            path.addLine(to: CGPoint(x: getMovePoint(rect: rect) + model.tailSize.width,
                                     y: rect.minY + insetValue))
            
//            path.move(to: CGPoint(x: rect.midX - (model.tailSize.width / 2) + model.movePoint,
//                                  y: rect.minY + insetValue))
            
//            path.addLine(to: CGPoint(x: rect.midX + model.movePoint,
//                                     y: rect.minY - model.tailSize.height + insetValue))
            
//            path.addLine(to: CGPoint(x: rect.midX + (model.tailSize.width / 2) + model.movePoint,
//                                     y: rect.minY + insetValue))
//
            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
                                             y: rect.minY + insetValue),
                        tangent2End: CGPoint(x: rect.maxX - insetValue,
                                             y: rect.minY + model.cornerRadius),
                        radius: model.cornerRadius)
            
            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
                                             y: rect.maxY - insetValue),
                        tangent2End: CGPoint(x: rect.maxX - model.cornerRadius,
                                             y: rect.maxY - insetValue),
                        radius: model.cornerRadius)
            
            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
                                             y: rect.maxY - insetValue),
                        tangent2End: CGPoint(x: rect.minX + insetValue,
                                             y: rect.maxY - model.cornerRadius),
                        radius: model.cornerRadius)
            
            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
                                             y: rect.minY + insetValue),
                        tangent2End: CGPoint(x: rect.minX + model.cornerRadius,
                                             y: rect.minY + insetValue),
                        radius: model.cornerRadius)
            
            path.closeSubpath()

//            path.addLine(to: CGPoint(x: rect.midX - (model.tailSize.width / 2) + model.movePoint,
//                                     y: rect.minY + insetValue))
        }
    }
    
    func tailLeadingPath(in rect: CGRect) -> Path {
        Path { path in
            
//            path.move(to: CGPoint(x: rect.minX + insetValue,
//                                  y: rect.midY + (model.tailSize.width / 2) + model.movePoint))
//            
//            path.addLine(to: CGPoint(x: rect.minX - model.tailSize.height + insetValue,
//                                     y: rect.midY + model.movePoint))
//            
//            path.addLine(to: CGPoint(x: rect.minX + insetValue,
//                                     y: rect.midY - (model.tailSize.width / 2) + model.movePoint))
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.minX + model.cornerRadius,
//                                             y: rect.minY + insetValue),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.minY + model.cornerRadius),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - model.cornerRadius,
//                                             y: rect.maxY - insetValue),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.midY + (model.tailSize.width / 2) + model.movePoint),
//                        radius: model.cornerRadius)
//            
//            path.closeSubpath()
        }
    }
    
    func tailTrailingPath(in rect: CGRect) -> Path {
        Path { path in
            
//            path.move(to: CGPoint(x: rect.maxX - insetValue,
//                                  y: rect.midY - (model.tailSize.width / 2) + model.movePoint))
//            
//            path.addLine(to: CGPoint(x: rect.maxX + model.tailSize.height - insetValue,
//                                     y: rect.midY + model.movePoint))
//            
//            path.addLine(to: CGPoint(x: rect.maxX - insetValue,
//                                     y: rect.midY + (model.tailSize.width / 2) + model.movePoint))
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - model.cornerRadius,
//                                             y: rect.maxY - insetValue),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.maxY - model.cornerRadius),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.minX + model.cornerRadius,
//                                             y: rect.minY + insetValue),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.midY - (model.tailSize.width / 2) + model.movePoint),
//                        radius: model.cornerRadius)
//            
//            path.closeSubpath()
            
//            path.addLine(to: CGPoint(x: rect.maxX - insetValue, y: rect.midY - (model.tailSize.width / 2) + model.movePoint))
        }
    }
    
    func tailBottomPath(in rect: CGRect) -> Path {
        Path { path in
            
//            path.move(to: CGPoint(x: rect.midX + (model.tailSize.width / 2) + model.movePoint,
//                                  y: rect.maxY - insetValue))
//            
//            path.addLine(to: CGPoint(x: rect.midX + model.movePoint,
//                                     y: rect.maxY + model.tailSize.height))
//            
//            path.addLine(to: CGPoint(x: rect.midX - (model.tailSize.width / 2) + model.movePoint,
//                                     y: rect.maxY - insetValue))
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: (CGPoint(x: rect.minX + insetValue,
//                                              y: rect.maxY - model.cornerRadius)),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.minX + model.cornerRadius,
//                                             y: rect.minY + insetValue),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.minY + insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.minY + model.cornerRadius),
//                        radius: model.cornerRadius)
//            
//            path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue,
//                                             y: rect.maxY - insetValue),
//                        tangent2End: CGPoint(x: rect.maxX - model.cornerRadius,
//                                             y: rect.maxY - insetValue),
//                        radius: model.cornerRadius)
//            
//            path.closeSubpath()
        }
    }
}

//let path = Path { path in
//
//    path.move(to: CGPoint(x: rect.minX + model.radius, y: rect.minY + insetValue))
//
//    path.addLine(to: CGPoint(x: rect.midX - (model.tailSize.width / 2), y: rect.minY + insetValue))
//
//    path.addLine(to: CGPoint(x: rect.midX + insetValue, y: rect.minY - model.tailSize.height))
//
//    path.addLine(to: CGPoint(x: rect.midX + insetValue + (model.tailSize.width / 2), y: rect.minY + insetValue))
//
//    path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.maxX - insetValue, y: rect.midY - (model.radius / 2)), model.radius: model.radius)
//
//    path.addArc(tangent1End: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.maxX - model.radius, y: rect.maxY - insetValue), model.radius: 12)
//
//    path.addLine(to: CGPoint(x: rect.minX + model.radius, y: rect.maxY - insetValue))
//
//    path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.maxY - insetValue), tangent2End: CGPoint(x: rect.minX + insetValue, y: rect.maxY - (model.radius / 2)), model.radius: 12)
//
//    path.addArc(tangent1End: CGPoint(x: rect.minX + insetValue, y: rect.minY + insetValue), tangent2End: CGPoint(x: rect.minX + model.radius, y: rect.minY + insetValue), model.radius: 12)
//
//}


//        let path = Path { path in
//
//            path.move(to: CGPoint(x: rect.minX + model.radius, y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.midX - (model.tailSize.width / 2), y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.midX + insetValue, y: rect.minY - model.tailSize.height))
//
//            path.addLine(to: CGPoint(x: rect.midX + insetValue + (model.tailSize.width / 2), y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.maxX - model.radius, y: rect.minY + insetValue))
//
//            path.addQuadCurve(to: CGPoint(x: rect.maxX - insetValue, y: rect.midY - (model.radius / 2)), control: CGPoint(x: rect.maxX - insetValue, y: rect.minY + insetValue))
//
//            path.addLine(to: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - model.radius))
//
//            path.addQuadCurve(to: CGPoint(x: rect.maxX - model.radius, y: rect.maxY - insetValue), control: CGPoint(x: rect.maxX - insetValue, y: rect.maxY - insetValue))
//
//            path.addLine(to: CGPoint(x: rect.minX + model.radius, y: rect.maxY - insetValue))
//
//            path.addQuadCurve(to: CGPoint(x: rect.minX + insetValue, y: rect.midY + (model.radius / 2)), control: CGPoint(x: rect.minX + insetValue, y: rect.maxY))
//
//            path.addLine(to: CGPoint(x: rect.minX + insetValue, y: rect.midY - (model.radius / 2)))
//
//            path.addQuadCurve(to: CGPoint(x: rect.minX + model.radius, y: rect.minY + insetValue), control: CGPoint(x: rect.minX + insetValue, y: rect.minY + insetValue))
//        }


#Preview {
    ContentView()
}
