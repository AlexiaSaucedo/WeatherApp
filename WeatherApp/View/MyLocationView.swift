//
//  myLocationView.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 27/11/23.
//

import UIKit

class MyLocationView : UIView {
    
    //MARK: Components
    
    private let currentLocationBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Use Current Location"
        config.baseBackgroundColor = UIColor(named: "AccentColor")
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "location.circle.fill")
        config.imagePadding = 10
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
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
        self.addSubview(currentLocationBtn)
        
        let buttonConstraints = [
            currentLocationBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            currentLocationBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            currentLocationBtn.topAnchor.constraint(equalTo: self.topAnchor),
            currentLocationBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
}
