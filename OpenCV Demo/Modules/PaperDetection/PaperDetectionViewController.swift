//
//  PaperDetectionViewController.swift
//  OpenCV Demo
//
//  Created by Shaker on 3/19/20.
//  Copyright © 2020 Shaker. All rights reserved.
//

import UIKit

class PaperDetectionViewController: UIViewController {

    @IBOutlet weak private var originalImageView: UIImageView!
    @IBOutlet weak private var resultImageView: UIImageView!
    
    private let originalImage = UIImage(named: "receipt")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(OpenCVWrapper.openCVVersionString())")
        
        originalImageView.image = originalImage
        resultImageView.image = originalImage
        
        let cropRect: CropRect = resultImageView.detectEdges()
        resultImageView.image = resultImageView.crop(cropRect, andApplyBW: true)
    }
}

