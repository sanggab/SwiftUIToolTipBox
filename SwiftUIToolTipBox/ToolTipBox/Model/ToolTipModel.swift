//
//  ToolTipModel.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI


@frozen public enum ToolTipShapeStyle: Equatable {
    case fill
    case stroke
    case all
}

@frozen public struct ToolTipModel: Equatable {
    
    public var tailSize: CGSize
    
    public var cornerRadius: CGFloat
    
    public var fillColor: Color
    
    public var strokeColor: Color
    
    public var style: ToolTipShapeStyle
    
    public var strokeStyle: StrokeStyle
    
    public init(tailSize: CGSize,
                cornerRadius: CGFloat,
                fillColor: Color = .white,
                strokeColor: Color = .white,
                style: ToolTipShapeStyle,
                strokeStyle: StrokeStyle = StrokeStyle()) {
        self.tailSize = tailSize
        self.cornerRadius = cornerRadius
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.style = style
        self.strokeStyle = strokeStyle
    }
}
