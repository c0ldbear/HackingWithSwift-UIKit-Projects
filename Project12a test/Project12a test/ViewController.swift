//
//  ViewController.swift
//  Project12a test
//
//  Created by teddy on 2022-09-07.
//

import UIKit

class ViewController: UIViewController {
    
    var helloWorldLabel: UILabel!
    
    let userDefaults = UserDefaults.standard
    var name = "World"
    
    override func loadView() {
        name = userDefaults.object(forKey: "Name") as? String ?? "World"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .systemBackground
        
        helloWorldLabel = UILabel()
        helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false
        helloWorldLabel.text = "Hello, \(name)!"
        helloWorldLabel.font = UIFont.systemFont(ofSize: 64, weight: .heavy)
        helloWorldLabel.sizeToFit()
        view.addSubview(helloWorldLabel)
        
        helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        NSLayoutConstraint.activate([
//            helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        // Play with userdefaults here
        userDefaults.set(25, forKey: "Age")
        userDefaults.set("Ada", forKey: "Name")
        userDefaults.set(true, forKey: "UseTouchID")
        userDefaults.set(CGFloat.pi, forKey: "Pi")
        userDefaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        userDefaults.set(array, forKey: "SavedArray")

        let dict = ["Name": name, "Country": "UK"]
        userDefaults.set(dict, forKey: "SavedDict")
    }


}

