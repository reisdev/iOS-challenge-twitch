//
//  OnboardingView.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 19/08/23.
//

import SwiftUI

enum OnboardingContent: Int, CaseIterable, Identifiable {

    case livestreams
    case chat
    case signUp

    var id: Self { self }

    var title: String {
        switch self {
        case .livestreams:
            return "Watch livestreams from all around the world"
        case .chat:
            return "Chat with people and watch together"
        case .signUp:
            return "Create your account to have a custom experience"
        }
    }

    var description: String {
        switch self {
        case .livestreams:
            return "Quickly find what you want to watch"
        case .chat:
            return "Make new friends and enjoy the content together "
        case .signUp:
            return "Save your favorites, win prizes and make history!"
        }
    }

    var next: OnboardingContent? {
        switch self {
        case .livestreams:
            return .chat
        case .chat:
            return .signUp
        default:
            return nil
        }
    }
}

struct OnboardingView: View {

    typealias OnTapAction = () -> Void

    @State var isVisible = false

    let content: OnboardingContent
    var onTapAction: OnTapAction? = nil

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text(content.title)
                .foregroundColor(.accentColor)
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.black)
                .padding(.horizontal, 24.0)
                .padding(.top, 16.0)
            Text(content.description)
                .foregroundColor(.secondary)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24.0)
            Button {
                onTapAction?()
            } label: {
                Image(systemName: "arrow.right")
                    .frame(width: 54.0, height: 54.0)
            }.clipped()
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(32.0)
                .padding(16.0)
            Spacer()
        }
        .frame(minHeight: 200)
    }
}

struct OnboardingView_Previews: PreviewProvider {

    static var previews: some View {
        OnboardingView(content: .livestreams) {
            print("Livestream")
        }
        OnboardingView(content: .chat) {
            print("Chat")
        }
        OnboardingView(content: .signUp) {
            print("Sign Up")
        }
    }
}
