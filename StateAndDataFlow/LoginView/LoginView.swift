//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginViewVM: LoginViewViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Text("\(loginViewVM.name.count)")
                    .foregroundColor(loginViewVM.isNameValid ? .green : .red)
            }

            Button("OK") {
                loginViewVM.isLoggedIn = true
                let user = User(name: loginViewVM.name, isLoggedIn: true)
                StorageManager.shared.save(user: user)
            }
            .disabled(!loginViewVM.isNameValid)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
