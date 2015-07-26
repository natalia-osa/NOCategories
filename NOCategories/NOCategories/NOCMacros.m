//
//  NOCMacros.m
//  NOCategories
//
//  Created by Natalia Osiecka on 27.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCMacros.h"

@implementation NOCMacros

#pragma mark - Colors

inline UIColor *noc_rgbToColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

inline UIColor *noc_hexToColor(NSUInteger hex, CGFloat alpha) {
    return noc_rgbToColor(hex >> 16 & 0xff, hex >> 8 & 0xff, hex & 0xff, alpha);
}

@end
