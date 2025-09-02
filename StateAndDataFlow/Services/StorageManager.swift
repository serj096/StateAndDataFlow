//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by serj on 02.09.2025.
//

import SwiftUI


final class StorageManager {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    static let shared = StorageManager()

    private init() {}

    func save(user: User) {
        userName = user.name
        isLoggedIn = user.isLoggedIn
    }

    func loadUser() -> User {
        User(name: userName, isLoggedIn: isLoggedIn)
    }

    func logout() {
        isLoggedIn = false
        userName = ""
    }
}
