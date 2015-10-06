//
//  NSAttributedString+NOCSize.m
//  NOCategories
//
//  Created by Natalia Paula Osiecka on 24/07/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import "NSAttributedString+NOCSize.h"

@implementation NSAttributedString (NOCSize)

- (CGSize)noc_backwardCompatibleSizeConstrainedToSize:(CGSize)size {
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

@end
