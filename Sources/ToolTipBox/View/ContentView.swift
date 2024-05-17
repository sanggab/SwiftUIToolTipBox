//
//  ContentView.swift
//  SwiftUIToolTipBox
//
//  Created by Gab on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("나는 문어 대왕 문어")
            .padding(.all, 8)
            .toolTip {
                ToolTipModel(style: .fillWithStrokeBorder,
                             tailSize: CGSize(width: 20, height: 14),
                             tailPosition: .top,
                             tailAlignment: .trailing,
                             cornerRadius: 10,
                             fillColor: .pink,
                             strokeColor: .orange,
                             strokeStyle: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
            .background(Color.pink, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
