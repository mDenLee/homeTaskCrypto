

import UIKit

class CoinListView: UIView {

    let tableView = UITableView()
    let actiityIndicator = UIActivityIndicatorView()

    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }

    func setViews() {
        tableView.register(CoinCell.self, forCellReuseIdentifier: CoinCell.reuseID)
        self.actiityIndicator.startAnimating()
        
    }
    
    func setConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(actiityIndicator)
        actiityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            actiityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            actiityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
