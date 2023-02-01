
import UIKit


class CoinView: UIView {
    
    let nameLabel = UILabel()
    let symbolLabel = UILabel()
    let costLabel = UILabel()
    let signOutButton = UIButton(type: .system)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews() {
        backgroundColor = .white
        signOutButton.setTitle("Выход", for: .normal)
    }
    
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, symbolLabel, costLabel, signOutButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 20
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
