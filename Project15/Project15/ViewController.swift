//
//  ViewController.swift
//  Project15
//
//  Created by teddy on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tapButton: UIButton!
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        //        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        // Put image in center with help of code
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

    @IBAction func tapped(_ sender: Any) {
        currentAnimation += 1
        print("Current animation: \(currentAnimation)")
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

