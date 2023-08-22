//
//  PageIndicator.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 19/08/23.
//

import SwiftUI

struct PageIndicator: View {
    let page: Int

    var body: some View {
        HStack {
            ForEach(0..<3) { index in
                Rectangle()
                    .frame(width: index == page ? 24.0 : 8.0, height: 8.0)
                    .cornerRadius(8.0)
                    .foregroundColor(index == page ? .accentColor : .secondary)
            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(page: 0)
        PageIndicator(page: 1)
        PageIndicator(page: 2)
    }
}
