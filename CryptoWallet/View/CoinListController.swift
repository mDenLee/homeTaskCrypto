
import UIKit

class CoinListController: UIViewController {
    let viewModel: CoinListViewModel
    let mainView = CoinListView()
    
    init(viewModel: CoinListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        viewModel.getData {
            self.mainView.tableView.reloadData()
            self.mainView.actiityIndicator.stopAnimating()
            self.mainView.actiityIndicator.hidesWhenStopped = true
        }

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CoinListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.reuseID) as! CoinCell
        if let coin = viewModel.coinData?.data[indexPath.row] {
            cell.titleLabel.text = coin.name
            let price = String(format: "%.2f", coin.metrics.marketData.priceUsd)
            cell.costLabel.text = "$\(price)"
            let change = coin.metrics.marketData.percentChangeUsdLast24Hours * coin.metrics.marketData.priceUsd / 100
            let changeStr = String(format: "%.2f", change)
            cell.changeLabel.text = changeStr
            if changeStr.first == "-" {
                cell.changeLabel.textColor = .red
            } else {
                cell.changeLabel.textColor = .green
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CoinController()
        vc.viewModel.coin = viewModel.coinData?.data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
