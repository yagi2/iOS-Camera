//
//  ViewController.swift
//  MyCamera
//
//  Created by Itsuki Aoyagi on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureImage: UIImageView!

    @IBAction func cameraButtonAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        if let shareImage = pictureImage.image {
            let shareItems = [shareImage]
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}
