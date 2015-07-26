//
//  NOCCGFloatMath.h
//  NOCategories
//
//  Created by Natalia Paula Osiecka on 24/07/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NOCCGFloatMath : NSObject

#pragma mark - Radians <-> Degree conversion

/**
 *  Converts degrees to radians.
 */
extern CGFloat noc_radians(CGFloat degrees);

/**
 *  Converts radians to degrees.
 */
extern CGFloat noc_degrees(CGFloat radians);

#pragma mark - Comparing

/**
 *  Checks if both values are moreover the same. Measurement error is equal to FLT_EPSILON.
 *
 *  @return YES if x == y.
 */
extern BOOL noc_isCGFloatEqualToCGFloat(CGFloat x, CGFloat y);

/**
 *  Checks if x is less than y.
 *
 *  @return YES if x < y.
 */
extern BOOL noc_isCGFloatLessThanCGFloat(CGFloat x, CGFloat y);

/**
 *  Checks if x is less or equal to y. Measurement error is equal to FLT_EPSILON.
 *
 *  @return YES if x <= y.
 */
extern BOOL noc_isCGFloatLessOrEqualToCGFloat(CGFloat x, CGFloat y);

/**
 *  Checks if x is more than y.
 *
 *  @return YES if x > y.
 */
extern BOOL noc_isCGFloatMoreThanCGFloat(CGFloat x, CGFloat y);

/**
 *  Checks if x is more or equal to y. Measurement error is equal to FLT_EPSILON.
 *
 *  @return YES if x >= y.
 */
extern BOOL noc_isCGFloatMoreOrEqualToCGFloat(CGFloat x, CGFloat y);

#pragma mark - Variables

/**
 *  The Epsilon value for CGFloat, basing on whether it's kind of Double or Float.
 *
 *  @return Epsilon for CGFloat kind.
 */
extern CGFloat noc_CGFloatEpsilon();

#pragma mark - Value rounding

/**
 *  Rounds the value of x to nearest full value. Eg 1.1 -> 1.0; 1.5 -> 2.0; 1.6 -> 2.0.
 *
 *  @return Closest full value to the x.
 */
extern CGFloat noc_roundCGFloat(CGFloat x);

/**
 *  Cuts the end of value x. Eg 1.1 -> 1.0; 1.6 -> 1.0.
 *
 *  @return Smallest full value from the x.
 */
extern CGFloat noc_floorCGFloat(CGFloat x);

/**
 *  Adds to the nearest full value of x. Eg 1.1 -> 2.0; 1.6 -> 2.0.
 *
 *  @return Biggest full value from the x.
 */
extern CGFloat noc_ceilCGFloat(CGFloat x);

#pragma mark - Other calculations

/**
 *  Changes the value to absolute, eg -1 to 1, 1 to 1.
 *
 *  @param x The value which should be transformed to absolute value.
 *
 *  @return Absolute value of x.
 */
extern CGFloat noc_CGFloatAbs(CGFloat x);

@end
