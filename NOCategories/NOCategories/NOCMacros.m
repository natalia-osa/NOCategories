//
//  NOCMacros.m
//  NOCategories
//
//  Created by Natalia Osiecka on 27.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCMacros.h"

@implementation NOCMacros

#pragma mark - Math

inline BOOL noc_isFloatEqual(CGFloat x, CGFloat y) {
    return (fabs(x - y) < FLT_EPSILON);
}

inline BOOL noc_isFloatLess(CGFloat x, CGFloat y) {
    return (x < y + FLT_EPSILON);
}

inline BOOL noc_isFloatLessOrEqual(CGFloat x, CGFloat y) {
    return (noc_isFloatLess(x, y) || noc_isFloatEqual(x, y));
}

inline BOOL noc_isFloatMore(CGFloat x, CGFloat y) {
    return (x > y - FLT_EPSILON);
}

inline BOOL noc_isFloatMoreOrEqual(CGFloat x, CGFloat y) {
    return (noc_isFloatMore(x, y) || noc_isFloatEqual(x, y));
}

#pragma mark - Colors

inline UIColor *noc_rgbToColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:(red / 255.f) green:(green / 255.f) blue:(blue / 255.f) alpha:alpha];
}

inline UIColor *noc_hexToColor(NSUInteger hex, CGFloat alpha) {
    return noc_rgbToColor(hex >> 16 & 0xff, hex >> 8 & 0xff, hex & 0xff, alpha);
}

@end
