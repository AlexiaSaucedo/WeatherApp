//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 27/11/23.
//

import UIKit

class TemperatureView : UIView {
    
// MARK: Components
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private let tempImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "sun.max.fill")
        imageView.tintColor = UIColor(named: "primarySunny")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Madrid, Spain"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "21 ºC"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 100.0, weight: .medium)
        label.textAlignment = .center
        return label
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
// MARK: Constraints
    
    private func commonInit(){
        self.addSubview(tempImg)
        
        let imageConstraints = [
            tempImg.topAnchor.constraint(equalTo: self.topAnchor),
            tempImg.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tempImg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tempImg.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        addLabels()
        
    }
    
    private func addLabels(){
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(tempLabel)
        
        self.addSubview(stackView)
        
        let stackConstraints = [
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(stackConstraints)
        
    }
    
}
