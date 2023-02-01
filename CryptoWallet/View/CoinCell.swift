

import UIKit

class CoinCell: UITableViewCell {
    static let reuseID = "CoinCell"
    
    let titleLabel = UILabel()
    let costLabel = UILabel()
    let changeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setViews()
        setConstraints()
    }

    func setViews() {
       
    }
    
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, costLabel, changeLabel])
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
