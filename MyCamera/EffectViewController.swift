//
//  EffectViewController.swift
//  MyCamera
//
//  Created by Itsuki Aoyagi on 2021/06/04.
//

import UIKit

class EffectViewController: UIViewController {
    @IBOutlet weak var effectImage: UIImageView!
    
    private let filterArray = [ "CIPhotoEffectMono",
                                "CIPhotoEffectChrome",
                                "CIPhotoEffectFade",
                                "CIPhotoEffectInstant",
                                "CIPhotoEffectNoir",
                                "CIPhotoEffectProcess",
                                "CIPhotoEffectTonal",
                                "CIPhotoEffectTransfer",
                                "CISepiaTone"
    ]
    private var selectedFilterNumber = 0
    
    var originalImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effectImage.image = originalImage
    }
    
    @IBAction func effectButtonAction(_ sender: Any) {
        if let image = originalImage {
            // エフェクト1週したら元の画像に戻す
            if selectedFilterNumber == filterArray.count {
                selectedFilterNumber = 0
                effectImage.image = image
                return
            }
            
            let filterName = filterArray[selectedFilterNumber]
            selectedFilterNumber += 1
                        
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
        if let shareImage = effectImage.image?.resize() {
            let shareItems = [shareImage]
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
