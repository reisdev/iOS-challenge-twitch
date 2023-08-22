//
//  SignUpView.swift
//  iOS Challenge Twitch
//
//  Created by Matheus dos Reis de Jesus on 21/08/23.
//

import SwiftUI

struct SignUpView: View {

    @State var fullName: String = "Peter Parker"
    @State var email: String = "peterparker@example.com"
    @State var password: String = "**********"
    @State var termsAccepted: Bool = false

    private func createAccount() { }

    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Sign Up")
                .foregroundColor(.accentColor)
                .font(.title)
                .bold()
            Text("Full Name")
                .font(.callout)
                .bold()
            TextField("Full Name", text: $fullName)
                .font(.body)
                .bold()
                .padding(16.0)
                .foregroundColor(.black)
                .clipped()
                .background(Color.secondaryColor)
                .cornerRadius(8.0)
            Text("E-mail")
                .font(.callout)
                .bold()
            TextField("E-mail", text: $email)
                .font(.body)
                .bold()
                .foregroundColor(.black)
                .textContentType(.emailAddress)
                .padding(16.0)
                .clipped()
                .background(Color.secondaryColor)
                .cornerRadius(8.0)
            Text("Password")
                .font(.callout)
                .bold()
            SecureField("Password", text: $password)
                .font(.body)
                .bold()
                .foregroundColor(.black)
                .padding(16.0)
                .clipped()
                .background(Color.secondaryColor)
                .cornerRadius(8.0)
            Toggle(isOn: $termsAccepted) {
                Group {
                    Text("I agree to the ") +
                    Text("Terms & Conditions")
                        .foregroundColor(.accentColor) +
                    Text(" and ") +
                    Text("Privacy Policy")
                        .foregroundColor(.accentColor)
                }.multilineTextAlignment(.leading)
                    .font(.footnote)
                    .bold()
            }.toggleStyle(iOSCheckboxToggleStyle())
            VStack {
                Button(action: createAccount, label: {
                    Text("Create Account")
                        .bold()
                        .padding(12.0)
                        .foregroundColor(.white)
                }).frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(8.0)
                HStack(alignment: .center, spacing: 16.0) {
                    Rectangle()
                        .frame(height: 1)
                    Text("or")
                        .bold()
                    Rectangle()
                        .frame(height: 1)
                }.foregroundColor(.secondary)
                    .padding(.horizontal, 4.0)

                Button(action: createAccount, label: {
                    HStack(alignment: .center, spacing: 16.0) {
                        Image("amazon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24.0, height: 24.0)
                        Text("Sign up with Amazon")
                            .bold()
                    }
                    .padding(12.0)
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.accentColor, lineWidth: 3.0)
                    }
                })
                .cornerRadius(8.0)
                Group {
                    Text("Already have an account? ") +
                    Text("Sign in")
                        .bold()
                        .foregroundColor(Color.accentColor)
                }.font(.callout)
                    .padding(8.0)
            }
            Spacer()
        }.frame(maxWidth: .infinity)
            .padding(24.0)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
