

import Foundation

class AuthViewModel {
    
    let trueLogin = "Vasya"
    let truePass = "12345"
    var currentUser: User?
    
    func signIn(login: String, password: String) throws {
        guard login == trueLogin else { throw AuthError.notExists }
        guard password == truePass else { throw AuthError.wrongPassword }
        UDService.shared.addUser(login: trueLogin, password: truePass)
        currentUser = User(login: trueLogin, password: truePass)
    }
}

enum AuthError: Error {
    case notExists
    case wrongPassword
}

