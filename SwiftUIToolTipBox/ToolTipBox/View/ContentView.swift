//
//  ContentView.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
    
    var model: ToolTipModel = ToolTipModel(tailSize: CGSize(width: 20, height: 14), cornerRadius: 50, fillColor: .mint, strokeColor: .blue, style: .all, strokeStyle: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
    
    var body: some View {
        ZStack {

        }
        .frame(width: 200, height: 100)
        .modifier(ToolTipViewModifier(model: model))
        
//        Text("오 안녕하세요")
//            .padding(.vertical, 8)
//            .padding(.horizontal, 8)
//            .background(.mint)
//            .cornerRadius(12)
//            .modifier(ToolTipViewModifier(model: model))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
