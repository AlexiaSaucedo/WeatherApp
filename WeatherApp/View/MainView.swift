//
//  MainView.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 15/11/23.
//

import UIKit

class MainView : UIView {
    
// MARK: Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let temperatureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let currentLocationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let tempImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "sun.max.fill")
        imageView.tintColor = UIColor(named: "primarySunny")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let tempInfoView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 1
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        stackView.backgroundColor = UIColor.systemBlue
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
//    private let cityLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Madrid, Spain"
//        label.textColor = UIColor.white
//        label.font = UIFont.systemFont(ofSize: 30.0)
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let tempLabel: UILabel = {
//        let label = UILabel()
//        label.text = "21 ºC"
//        label.textColor = UIColor.white
//        label.font = UIFont.systemFont(ofSize: 100.0, weight: .medium)
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

    
    private let currentLocationBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Use Current Location"
        config.baseBackgroundColor = UIColor(named: "AccentColor")
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

// MARK: Add Components to View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "backgroundSunny")
        
        //tempInfoView.addSubview(cityLabel)
        //tempInfoView.addSubview(tempLabel)
        //temperatureView.addSubview(tempInfoView)
        
        temperatureView.addSubview(tempImg)

        // Add components to the stack view
        stackView.addArrangedSubview(searchView)
        stackView.addArrangedSubview(temperatureView)
        stackView.addArrangedSubview(currentLocationView)
        

        // Add the stack view to the main view
        addSubview(stackView)

// MARK: Constraints
        
        let mainStackConstraints = [
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ]
        
        let searchViewConstraints = [
            searchView.widthAnchor.constraint(equalToConstant: 350),
            searchView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let temperatureViewConstraints = [
            temperatureView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            temperatureView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ]
        
        let locationViewConstraints = [
            currentLocationView.widthAnchor.constraint(equalToConstant: 200),
            currentLocationView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let imageConstraints = [
            tempImg.topAnchor.constraint(equalTo: temperatureView.topAnchor),
            tempImg.leadingAnchor.constraint(equalTo: temperatureView.leadingAnchor),
            tempImg.bottomAnchor.constraint(equalTo: temperatureView.bottomAnchor),
            tempImg.trailingAnchor.constraint(equalTo: temperatureView.trailingAnchor)
        ]
        
//        let tempInfoViewConstraints = [
//            tempInfoView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            tempInfoView.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ]
        
        // Enable Auto Layout
        NSLayoutConstraint.activate(mainStackConstraints)
        NSLayoutConstraint.activate(searchViewConstraints)
        NSLayoutConstraint.activate(temperatureViewConstraints)
        NSLayoutConstraint.activate(locationViewConstraints)
        NSLayoutConstraint.activate(imageConstraints)
        //NSLayoutConstraint.activate(tempInfoViewConstraints)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    
