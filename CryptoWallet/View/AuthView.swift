

import UIKit

class AuthView: UIView {
    let loginTF = UITextField()
    let passTF = UITextField()
    let signInButton = UIButton(type: .system)

    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        loginTF.placeholder = "Введите логин"
        passTF.placeholder = "Введите пароль"
        passTF.isSecureTextEntry = true
        signInButton.setTitle("Войти", for: .normal)
    }
    
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [loginTF, passTF, signInButton])
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 16
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 48),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
            if view is UITextField {
                (view as! UITextField).leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
                (view as! UITextField).leftViewMode = .always
                view.layer.shadowColor = UIColor.gray.cgColor
                view.layer.shadowOpacity = 0.4
                view.layer.shadowRadius = 3
                view.layer.shadowOffset = CGSize(width: 0, height: 0)
                view.backgroundColor = .white
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
