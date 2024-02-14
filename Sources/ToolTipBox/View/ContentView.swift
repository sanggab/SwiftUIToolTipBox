//
//  ContentView.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("오 안녕하세요")
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .toolTip {
                    ToolTipModel(style: .fill,
                                 tailSize: CGSize(width: 20, height: 14),
                                 tailPosition: .bottom,
                                 movePoint: 0,
                                 cornerRadius: 6,
                                 fillColor: .red,
                                 strokeColor: .blue,
                                 strokeStyle: StrokeStyle(lineWidth: 2,
                                                          lineCap: .round,
                                                          lineJoin: .round))
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
