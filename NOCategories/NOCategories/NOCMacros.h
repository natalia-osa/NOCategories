//
//  NOCMacros.h
//  NOCategories
//
//  Created by Natalia Osiecka on 27.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - String shortcuts
#define noc_lfString(m, ...)            [NSString stringWithFormat:NSLocalizedString(m, nil), __VA_ARGS__] // Localized + Format
#define noc_fString(m, ...)             [NSString stringWithFormat:m, __VA_ARGS__] // Format
#define noc_lString(m, ...)             NSLocalizedString(m, nil) // Localized

#pragma mark Bit operations
#define noc_isBitOne(number, bit)       (BOOL)(number & bit)
#define noc_setBitOne(number, bit)      number |= bit
#define noc_setBitZero(number, bit)     number &= ~bit

#pragma mark Warnings
#define noc_warnWork(m)                 _NOC_PRAGMA(message "[WorkInProgress] " m)
#define noc_warnTemp(m)                 _NOC_PRAGMA(message "[Temp] " m)
#define noc_warnHack(m)                 _NOC_PRAGMA(message "[Hack] " m)
#define noc_warnToDo(m)                 _NOC_PRAGMA(message "[TODO] " m)
#define noc_warnFixMe(m)                _NOC_PRAGMA(message "[FixMe] " m)

#pragma mark Helpers
#define _NOC_PRAGMA(p)                  _Pragma(#p)

@interface NOCMacros : NSObject

#pragma mark Math : radians - degree conversion

/**
 *  Converts degrees to radians.
 */
extern CGFloat noc_radians(CGFloat degrees);

/**
 *  Converts radians to degrees.
 */
extern CGFloat noc_degrees(CGFloat radians);

#pragma mark Math : comparing floats

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

#pragma mark Math : CGFloat rounding

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

#pragma mark Colors

/**
 *  Creates and returns a color object using the specified opacity and RGB component values.
 *
 *  @param red   The red component of the color object, specified as a value from 0.f to 255.f.
 *  @param green The green component of the color object, specified as a value from 0.f to 255.f.
 *  @param blue  The blue component of the color object, specified as a value from 0.f to 255.f.
 *  @param alpha The alpha component, specified as a value from 0.f to 1.f.
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
extern UIColor *noc_rgbToColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);
/**
 *  Creates and returns a color object using the specified opacity and HEX code color.
 *
 *  @param hex   The HEX of selected color (case insensitive), where # is exchanged with 0x. Eg 0xAe323B.
 *  @param alpha The alpha component, specified as a value from 0.f to 1.f.
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
extern UIColor *noc_hexToColor(NSUInteger hex, CGFloat alpha);

@end
