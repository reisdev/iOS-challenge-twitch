//
//  ContentView.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 22/08/23.
//

import SwiftUI

enum Flow {
    case splash
    case home
}

struct ContentView: View {

    @State var flow: Flow = .splash

    var body: some View {
        switch flow {
        case .splash:
            SplashScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        flow = .home
                    }
                }
        case .home:
            HomeScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
