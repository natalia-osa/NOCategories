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

inline CGFloat noc_radians(CGFloat degrees) {
    return (degrees * M_PI / 180.0);
}

inline CGFloat noc_degrees(CGFloat radians) {
    return (radians * 180.0 / M_PI);
}

inline BOOL noc_isCGFloatEqualToCGFloat(CGFloat x, CGFloat y) {
    if (CGFLOAT_IS_DOUBLE) {
        return (fabs(x - y) < DBL_EPSILON);
    } else {
        return (fabsf(x - y) < FLT_EPSILON);
    }
}

inline BOOL noc_isCGFloatLessThanCGFloat(CGFloat x, CGFloat y) {
    return (x < y);
}

inline BOOL noc_isCGFloatLessOrEqualToCGFloat(CGFloat x, CGFloat y) {
    return (noc_isCGFloatLessThanCGFloat(x, y) || noc_isCGFloatEqualToCGFloat(x, y));
}

inline BOOL noc_isCGFloatMoreThanCGFloat(CGFloat x, CGFloat y) {
    return (x > y);
}

inline BOOL noc_isCGFloatMoreOrEqualToCGFloat(CGFloat x, CGFloat y) {
    return (noc_isCGFloatMoreThanCGFloat(x, y) || noc_isCGFloatEqualToCGFloat(x, y));
}

inline CGFloat noc_roundCGFloat(CGFloat x) {
    return CGFLOAT_IS_DOUBLE ? round(x) : roundf(x);
}

inline CGFloat noc_floorCGFloat(CGFloat x) {
    return CGFLOAT_IS_DOUBLE ? floor(x) : floorf(x);
}

inline CGFloat noc_ceilCGFloat(CGFloat x) {
    return CGFLOAT_IS_DOUBLE ? ceil(x) : ceilf(x);
}

#pragma mark - Colors

inline UIColor *noc_rgbToColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

inline UIColor *noc_hexToColor(NSUInteger hex, CGFloat alpha) {
    return noc_rgbToColor(hex >> 16 & 0xff, hex >> 8 & 0xff, hex & 0xff, alpha);
}

@end
