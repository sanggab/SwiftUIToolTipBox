//
//  ToolTipModifier.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

public struct ToolTipViewModifier: ViewModifier {
    public var model: ToolTipModel
    
    public func body(content: Content) -> some View {
        let style = model.style
        
        content
            .overlay {
                if style == .stroke || style == .all {
                    ToolTipShape(radius: model.cornerRadius,
                                 tailSize: model.tailSize)
                        .strokeBorder(model.strokeColor, style: model.strokeStyle)
//                    .stroke(model.strokeColor, style: model.strokeStyle)
                }
            }
            .background {
                if style == .fill || style == .all {
                    ToolTipShape(radius: model.cornerRadius,
                                 tailSize: model.tailSize)
                        .fill(model.fillColor)
                }
            }
    }
}
