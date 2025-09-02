//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//
import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isLoggedIn: Bool = false
    
    var isNameValid: Bool {
        name.count >= 3
    }
    
    func login() {
        guard isNameValid else { return }
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
        name = ""
    }
}
