

import UIKit

class AuthController: UIViewController {
    let mainView = AuthView()
    let viewModel = AuthViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setActions()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                if let user = UDService.shared.getUser() {
                    let coinListVC = CoinListController(viewModel: CoinListViewModel(currentUser: user))
                    let vc = UINavigationController(rootViewController: coinListVC)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true) {
                        print("VC PRESENTED!")
                    }
                }
    }
    

    func setActions() {
        let authAction = UIAction { _ in
            guard let login = self.mainView.loginTF.text,
                  let password = self.mainView.passTF.text else { return }
            do {
                try self.viewModel.signIn(login: login, password: password)
                let user = self.viewModel.currentUser!
                let coinListViewModel = CoinListViewModel(currentUser: user)
                let vc = UINavigationController(rootViewController: CoinListController(viewModel: coinListViewModel))
                UDService.shared.addUser(login: user.login, password: user.password)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            } catch AuthError.notExists {
                self.showInfoAlert(message: "Пользователь не найден")
            } catch AuthError.wrongPassword {
                self.showInfoAlert(message: "Пароль неверный")
            } catch { }
        }
        
        mainView.signInButton.addAction(authAction, for: .touchUpInside)
    }
    
}

