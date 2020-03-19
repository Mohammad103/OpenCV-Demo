//
//  PaperDetectionViewController.swift
//  OpenCV Demo
//
//  Created by Shaker on 3/19/20.
//  Copyright © 2020 Shaker. All rights reserved.
//

import UIKit

class PaperDetectionViewController: UIViewController {

    @IBOutlet weak private var stitchedImageView: UIImageView!
    @IBOutlet weak private var resultImageView: UIImageView!
    
    private let originalImage = UIImage(named: "receipt2")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(OpenCVWrapper.openCVVersionString())")
        
        stitchImages()
        detectDocument()
    }
    
    private func detectDocument() {
        resultImageView.image = stitchedImageView.image
        let cropRect: CropRect = resultImageView.detectEdges()
        resultImageView.crop(cropRect, andApplyBW: true)
    }
    
    private func stitchImages() {
        let image1 = UIImage(named:"doc-part1")!.rotate(degrees: 90)!
        let image2 = UIImage(named:"doc-part2")!.rotate(degrees: 90)!
        let image3 = UIImage(named:"doc-part3")!.rotate(degrees: 90)!
        let image4 = UIImage(named:"doc-part4")!.rotate(degrees: 90)!
        
        let imageArray: [UIImage] = [image1, image2, image3, image4]
        stitchedImageView.image = OpenCVWrapper.process(with: imageArray).rotate(degrees: -90)
    }
}

