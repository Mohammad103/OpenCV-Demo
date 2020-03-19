//
//  OpenCVWrapper.m
//  OpenCV Demo
//
//  Created by Shaker on 3/19/20.
//  Copyright © 2020 Shaker. All rights reserved.
//

#import "OpenCVWrapper.h"

#import <opencv2/opencv.hpp>
#import "UIImage+OpenCV.h"
#import "UIImage+Rotate.h"
#import "stitching.h"

@implementation OpenCVWrapper

+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}

+ (UIImage*)processWithArray:(NSArray*)imageArray
{
    if ([imageArray count] == 0) {
        NSLog (@"imageArray is empty");
        return 0;
    }
    std::vector<cv::Mat> matImages;

    for (id image in imageArray) {
        if ([image isKindOfClass: [UIImage class]]) {
            /*
             All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
             */
            UIImage* rotatedImage = [image rotateToImageOrientation];
            cv::Mat matImage = [rotatedImage CVMat3];
            NSLog (@"matImage: %@",image);
            matImages.push_back(matImage);
        }
    }
    NSLog (@"stitching...");
    cv::Mat stitchedMat = stitch(matImages);
    UIImage* result =  [UIImage imageWithCVMat:stitchedMat];
    return result;
}

@end
