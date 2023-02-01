

import UIKit

class CoinController: UIViewController {
    
    let viewModel = CoinViewModel()
    let mainView = CoinView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupViews()
        addActions()
    }
    
    func setupViews() {
        guard let coin = viewModel.coin else { return }
        mainView.nameLabel.text = coin.name
        mainView.costLabel.text = "$\(String(format: "%.2f",  coin.metrics.marketData.priceUsd))"
        mainView.symbolLabel.text = coin.symbol
    }
   
    func addActions() {
        let signOutAction = UIAction { _ in
            UDService.shared.deleteUser()
            let authController = AuthController()
            authController.modalPresentationStyle = .fullScreen
//            self.present(authController, animated: true)
            self.navigationController?.dismiss(animated: true)
        }
        
        mainView.signOutButton.addAction(signOutAction, for: .touchUpInside)
        
    }

}
