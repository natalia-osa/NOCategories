//
//  NOCMacros.h
//  NOCategories
//
//  Created by Natalia Osiecka on 27.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark Bit operations
#define noc_isBitOne(number, bit)       (BOOL)(number & bit)
#define noc_setBitOne(number, bit)      number |= bit
#define noc_setBitZero(number, bit)     number &= ~bit
#define noc_isBitAtIndexOne(number, bit) ((number & (1 << bit)) != 0) // eg noc_isBitAtIndexOne(99, x) is YES for x = 0,1,5,6 because 99 = 0110 0011

#pragma mark Warnings
#define noc_warnWork(m)                 _NOC_PRAGMA(message "[WorkInProgress] " m)
#define noc_warnTemp(m)                 _NOC_PRAGMA(message "[Temp] " m)
#define noc_warnHack(m)                 _NOC_PRAGMA(message "[Hack] " m)
#define noc_warnToDo(m)                 _NOC_PRAGMA(message "[TODO] " m)
#define noc_warnFixMe(m)                _NOC_PRAGMA(message "[FixMe] " m)

#pragma mark Helpers
#define _NOC_PRAGMA(p)                  _Pragma(#p)

@interface NOCMacros : NSObject

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
