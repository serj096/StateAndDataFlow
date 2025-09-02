//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//
import SwiftUI
import Observation

struct RootView: View {
    @Bindable var viewModel: ContentViewViewModel
    @EnvironmentObject var loginViewVM: LoginViewViewModel

    var body: some View {
        if loginViewVM.isLoggedIn {
            ContentView(contentViewVM: viewModel) 
        } else {
            LoginView()
        }
    }
}
//#Preview {
//    RootView(viewModel: <#ContentViewViewModel#>)
//        .environmentObject(LoginViewViewModel())
//}
