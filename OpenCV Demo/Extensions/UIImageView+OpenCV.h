//
//  UIImage+OpenCV.h
//  OpenCVClient
//
//  Created by Washe on 01/12/2012.
//  Copyright 2012 Washe / Foundry. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import <UIKit/UIKit.h>

typedef struct CropRect {
    CGPoint topLeft;
    CGPoint topRight;
    CGPoint bottomLeft;
    CGPoint bottomRight;
} CropRect;

@interface UIImageView (OpenCV)

- (CropRect)detectEdges;
- (UIImage *)crop: (CropRect)cropRect andApplyBW:(BOOL)applyBW;

@end
