//
//  NSString+NOCSize.h
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (NOCSize)

/**
 * Select proper size calculation method to receive text size prior and after ios 7.
 * @param font The font to use for computing the string size.
 * @param size The maximum acceptable size for the string. This value is used to calculate where line breaks and wrapping would occur.
 * @return The width and height of the resulting string’s bounding box. These values may be rounded up to the nearest whole number.
 */
- (CGSize)noc_backwardCompatibleSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
