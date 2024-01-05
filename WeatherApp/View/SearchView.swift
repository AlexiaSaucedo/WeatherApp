//
//  SearchView.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 27/11/23.
//

import UIKit

class SearchView : UIView{
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    var searchTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "secondarySunny")
        textField.textColor = UIColor.gray
        return textField
    }()
    
    var searchButton : UIButton = {
        var config = UIButton.Configuration.tinted()
        config.baseBackgroundColor = UIColor(named: "accentSunny")
        config.image = UIImage(systemName: "magnifyingglass")
        config.buttonSize = .large
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(searchButton)
        
        self.addSubview(stackView)
        
        let textViewConstraints = [
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            searchTextField.heightAnchor.constraint(equalTo: self.heightAnchor)
        ]
        
        let buttonConstraints = [
            searchButton.widthAnchor.constraint(equalToConstant: 50), // Set your preferred size
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor) // 1:1 ratio
        ]
        
        let stackConstraints = [
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(stackConstraints)
        NSLayoutConstraint.activate(textViewConstraints)
    }
    
}
