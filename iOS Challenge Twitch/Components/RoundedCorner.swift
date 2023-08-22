//
//  RoundedCorner.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 19/08/23.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedCorner()
                .frame(width: 100, height: 100)
            RoundedCorner(radius: 24, corners: [.topLeft,.topRight])
                .frame(width: 200, height: 200)
        }
    }
}
