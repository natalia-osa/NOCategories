//
//  NOCCGFloatMath.m
//  NOCategories
//
//  Created by Natalia Paula Osiecka on 24/07/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import "NOCCGFloatMath.h"

@implementation NOCCGFloatMath

#pragma mark - Radians <-> Degree conversion

inline CGFloat noc_radians(CGFloat degrees) {
    return (degrees * M_PI / 180.0);
}

inline CGFloat noc_degrees(CGFloat radians) {
    return (radians * 180.0 / M_PI);
}

#pragma mark - Comparing

inline BOOL noc_isCGFloatEqualToCGFloat(CGFloat x, CGFloat y) {
    return noc_CGFloatAbs(x - y) < noc_CGFloatEpsilon();
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

#pragma mark - Variables

//##OBJCLEAN_SKIP##
inline CGFloat noc_CGFloatEpsilon() {
#if CGFLOAT_IS_DOUBLE
    return DBL_EPSILON;
#else
    return FLT_EPSILON;
#endif
}

#pragma mark - Value rounding

inline CGFloat noc_roundCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return round(x);
#else
    return roundf(x);
#endif
}

inline CGFloat noc_floorCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return floor(x);
#else
    return floorf(x);
#endif
}

inline CGFloat noc_ceilCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return ceil(x);
#else
    return ceilf(x);
#endif
}

#pragma mark - Other calculations

inline CGFloat noc_CGFloatAbs(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return fabs(x);
#else
    return fabsf(x);
#endif
}
//##OBJCLEAN_ENDSKIP##

@end
