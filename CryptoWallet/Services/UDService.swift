

import Foundation

class UDService {
    
    static let shared = UDService();
    private init() { }
    
    private let ud = UserDefaults.standard
    private let loginKey = "login"
    private let passwordKey = "password"
    
    func addUser(login: String, password: String) {
        ud.setValue(login, forKey: loginKey)
        ud.setValue(password, forKey: passwordKey)
    }
    
    func getUser() -> User? {
        guard let login = ud.value(forKey: loginKey) as? String else {
            return nil }
        guard let password = ud.value(forKey: passwordKey) as? String else { return nil }
        let user = User(login: login, password: password)
        print(user.login)
        print(user.password)
        return user
    }
    
    func deleteUser() {
        ud.setValue(nil, forKey: loginKey)
        ud.setValue(nil, forKey: passwordKey)
    }
}
