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
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
