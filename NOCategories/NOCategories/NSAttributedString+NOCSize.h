//
//  NSAttributedString+NOCSize.h
//  NOCategories
//
//  Created by Natalia Paula Osiecka on 24/07/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (NOCSize)

/**
 * Select proper size calculation method to receive text size after ios 7.
 *
 * @param size The maximum acceptable size for the string. This value is used to calculate where line breaks and wrapping would occur.
 * 
 * @return The width and height of the resulting string’s bounding box. These values may be rounded up to the nearest whole number.
 */
- (CGSize)noc_backwardCompatibleSizeConstrainedToSize:(CGSize)size;

@end
