//
//  OpenCVWrapper.m
//  OpenCV Demo
//
//  Created by Shaker on 3/19/20.
//  Copyright © 2020 Shaker. All rights reserved.
//

#import "OpenCVWrapper.h"

#import <opencv2/opencv.hpp>

@implementation OpenCVWrapper

+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}

@end
