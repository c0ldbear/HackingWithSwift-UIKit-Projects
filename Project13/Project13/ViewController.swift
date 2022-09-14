//
//  ViewController.swift
//  Project13
//
//  Created by teddy on 2022-09-14.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var intensity: UISlider!
    
    var currentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "YACIFP" // Yet Another Core Image Filters Program
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }
    
    @objc func importPicture() {
        print("importing picture...")
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func changeFilter() {}
    
    func save() {}
    
    func intensityChanged() {}
    
}

// To fulfill the inheritance of UIImagePickerControllerDelegate we need the following:
extension ViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
       
        dismiss(animated: true)
        
        currentImage = image
    }
}
