//
//  HomeScreen.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 18/08/23.
//

import SwiftUI

enum HomeStep {
    case onboarding
    case signUp

    var logoHeight: CGFloat {
        switch self {
        case .onboarding: return 150
        case .signUp: return 100
        }
    }
}

struct HomeScreen: View {

    @State var tab: OnboardingContent = .livestreams
    @State var homeStep: HomeStep = .onboarding

    private func nextTab() {
        guard let next = tab.next else {
            homeStep = .signUp
            return
        }
        tab = next
    }

    var body: some View {
        ZStack {
            Color.secondaryBackground
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 8.0)
                    .frame(maxWidth: .infinity, maxHeight: homeStep.logoHeight)
                Spacer()
                if homeStep == .onboarding {
                    Image("streaming")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                }
                VStack {
                    switch homeStep {
                    case .onboarding:
                        Group {
                            PageIndicator(page: tab.rawValue)
                                .padding(.top, 24.0)
                            TabView(selection: $tab) {
                                ForEach(OnboardingContent.allCases) { onboarding in
                                    OnboardingView(content: onboarding, onTapAction: nextTab)
                                        .tag(onboarding)
                                }
                            }.tabViewStyle(.page(indexDisplayMode: .never))
                                .animation(.easeOut, value: tab)

                        }
                    case .signUp:
                        SignUpView()
                    }
                }
                .animation(.easeInOut, value: homeStep)
                .frame(maxWidth: .infinity, maxHeight: homeStep == .onboarding ? 300 : .infinity)
                .background(.background)
                .clipShape(RoundedCorner(radius: 24,
                                         corners: [.topLeft, .topRight]))
            }.ignoresSafeArea(.container, edges: .bottom)
                .frame(alignment: .bottom)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
