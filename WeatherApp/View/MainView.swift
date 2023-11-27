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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 30
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
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    private let currentLocationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: Add Components to View
    private func commonInit() {
        backgroundColor = UIColor(named: "backgroundSunny")
        
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
        
        //        let tempInfoViewConstraints = [
        //            tempInfoView.centerXAnchor.constraint(equalTo: centerXAnchor),
        //            tempInfoView.centerYAnchor.constraint(equalTo: centerYAnchor)
        //        ]
        
        // Enable Auto Layout
        NSLayoutConstraint.activate(mainStackConstraints)
        NSLayoutConstraint.activate(searchViewConstraints)
        NSLayoutConstraint.activate(temperatureViewConstraints)
        NSLayoutConstraint.activate(locationViewConstraints)
        //NSLayoutConstraint.activate(imageConstraints)
        //NSLayoutConstraint.activate(tempInfoViewConstrain
        
    }
}

    
