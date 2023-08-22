//
//  SplashScreen.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 21/08/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondaryBackground)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
