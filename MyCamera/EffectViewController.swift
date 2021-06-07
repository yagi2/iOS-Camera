//
//  EffectViewController.swift
//  MyCamera
//
//  Created by Itsuki Aoyagi on 2021/06/04.
//

import UIKit

class EffectViewController: UIViewController {
    @IBOutlet weak var effectImage: UIImageView!
    
    var originalImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effectImage.image = originalImage
    }
    
    @IBAction func effectButtonAction(_ sender: Any) {
        if let image = originalImage {
            let filterName = "CIPhotoEffectMono"
            let rotate = image.imageOrientation

            let inputImage = CIImage(image: image)
            
            guard let effectFilter = CIFilter(name: filterName) else {
                return
            }
            
            effectFilter.setDefaults()
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
            guard let outputImage = effectFilter.outputImage else {
                return
            }
            
            let ciContext = CIContext(options: nil)
            
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                return
            }
            
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
