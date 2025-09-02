//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//
import SwiftUI
import Observation

struct ContentView: View {
    @Bindable var contentViewVM: ContentViewViewModel
    @EnvironmentObject var loginViewVM: LoginViewViewModel

    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)")
                .font(.title)
                .padding(.top, 50)

            Text("\(contentViewVM.counter)")
                .font(.largeTitle)
                .padding(.top, 50)

            ButtonView(contentViewVM: contentViewVM)

            Spacer()

            Button("Logout") {
                loginViewVM.isLoggedIn = false
                StorageManager.shared.logout()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
struct ButtonView: View {
    @Bindable var contentViewVM: ContentViewViewModel  // Observation

    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

#Preview {
    ContentView(contentViewVM: ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}
