//
//  OpenCVWrapper.h
//  OpenCV Demo
//
//  Created by Shaker on 3/19/20.
//  Copyright © 2020 Shaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject

+ (NSString *)openCVVersionString;

+ (UIImage *)processWithArray:(NSArray*)imageArray;

@end

NS_ASSUME_NONNULL_END
