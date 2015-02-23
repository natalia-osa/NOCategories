//
//  NSString+NOCSize.m
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NSString+NOCSize.h"

@implementation NSString (NOCSize)

- (CGSize)noc_backwardCompatibleSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    CGSize textSize;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        textSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
    } else {
        // silent the deprecation warning if your target is iOS 7.0+
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        textSize = [self sizeWithFont:font constrainedToSize:size];
#pragma clang diagnostic pop
    }
    
    return textSize;
}

@end
