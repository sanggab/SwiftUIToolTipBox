//
//  ToolTipModel.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

@frozen public enum TailPosition: Equatable {
    case top
    
    case leading
    
    case trailing
    
    case bottom
}


@frozen public enum ToolTipShapeStyle: Equatable {
    case fill
    
    case stroke
    
    case strokeBorder
    
    case fillWithStroke
    
    case fillWithStrokeBorder
}

@frozen public struct ToolTipModel: Equatable {
    
    public var style: ToolTipShapeStyle
    
    public var tailSize: CGSize
    
    public var tailPosition: TailPosition
    
    public var movePoint: CGFloat
    
    public var cornerRadius: CGFloat
    
    public var fillColor: Color
    
    public var strokeColor: Color
    
    public var strokeStyle: StrokeStyle
    
    public init(style: ToolTipShapeStyle,
                tailSize: CGSize = .zero,
                tailPosition: TailPosition = .top,
                movePoint: CGFloat = .zero,
                cornerRadius: CGFloat = .zero,
                fillColor: Color = .white,
                strokeColor: Color = .white,
                strokeStyle: StrokeStyle = StrokeStyle()) {
        self.style = style
        self.tailSize = tailSize
        self.tailPosition = tailPosition
        self.movePoint = movePoint
        self.cornerRadius = cornerRadius
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeStyle = strokeStyle
    }
}
