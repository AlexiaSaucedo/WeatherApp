//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexia Fernanda Saucedo Romero on 15/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .red
        
        // Instantiate the custom view
        let mainView = MainView()

        // Add the custom view to the view hierarchy
        view.addSubview(mainView)
        
        // Enable Auto Layout
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints to position and size CustomView
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

