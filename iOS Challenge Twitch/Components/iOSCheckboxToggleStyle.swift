//
//  iOSCheckboxStyle.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 21/08/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack(alignment: .center, spacing: 16.0) {
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .clipped()
                        .border(.foreground, width: 2.0)
                        .cornerRadius(4.0)
                        .frame(width: 24.0, height: 24.0)
                    if configuration.isOn {
                        Rectangle()
                            .fill(.foreground)
                            .clipped()
                            .border(.foreground, width: 2.0)
                            .cornerRadius(4.0)
                            .frame(width: 24.0, height: 24.0)
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }
                }
                configuration.label
                    .frame(alignment: .leading)
                    .foregroundColor(.secondary)
            }
        })
    }
}

struct iOSCheckboxToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle(isOn: .constant(false)) {
            Text("My Toggle")
        }.toggleStyle(iOSCheckboxToggleStyle())

        Toggle(isOn: .constant(true)) {
            Text("My Toggle")
        }.toggleStyle(iOSCheckboxToggleStyle())
    }
}
