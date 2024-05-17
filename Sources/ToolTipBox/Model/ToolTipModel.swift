//
//  ToolTipModel.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

@frozen
public enum TailPosition: Equatable {
    case top
    
    case leading
    
    case trailing
    
    case bottom
}


@frozen
public enum ToolTipShapeStyle: Equatable {
    case fill
    
    case stroke
    
    case strokeBorder
    
    case fillWithStroke
    
    case fillWithStrokeBorder
}

@frozen
public enum TailAlignment: Equatable {
    case leading
    
    case center
    
    case trailing
    
    case custom(CGFloat)
}

@frozen
public struct ToolTipModel: Equatable {
    
    public var style: ToolTipShapeStyle
    
    public var tailSize: CGSize
    
    public var tailPosition: TailPosition
    
    public var tailAlignment: TailAlignment
    
    public var cornerRadius: CGFloat
    
    public var fillColor: Color
    
    public var strokeColor: Color
    
    public var strokeStyle: StrokeStyle
    
    public init(style: ToolTipShapeStyle,
                tailSize: CGSize = .zero,
                tailPosition: TailPosition = .top,
                tailAlignment: TailAlignment = .center,
                cornerRadius: CGFloat = .zero,
                fillColor: Color = .white,
                strokeColor: Color = .white,
                strokeStyle: StrokeStyle = StrokeStyle()) {
        self.style = style
        self.tailSize = tailSize
        self.tailPosition = tailPosition
        self.tailAlignment = tailAlignment
        self.cornerRadius = cornerRadius
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeStyle = strokeStyle
    }
}
