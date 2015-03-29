//
//  EXPMatcher+UIColor.m
//  NOCategories
//
//  Created by Natalia Osiecka on 29.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "EXPMatcher+UIColor.h"
#import "NOCMacros.h"

EXPMatcherImplementationBegin(beSameColor, (UIColor *expected)) {
    BOOL actualIsNil = (actual == nil);
    BOOL expectedIsNil = (expected == nil);
    
    prerequisite(^BOOL {
        return !(actualIsNil || expectedIsNil);
    });
    
    __block CGFloat actualRed, actualGreen, actualBlue, actualAlpha;
    [actual getRed:&actualRed green:&actualGreen blue:&actualBlue alpha:&actualAlpha];
    
    __block CGFloat expectedRed, expectedGreen, expectedBlue, expectedAlpha;
    [expected getRed:&expectedRed green:&expectedGreen blue:&expectedBlue alpha:&expectedAlpha];
    
    match(^BOOL {
        BOOL isRedEqual = noc_isCGFloatEqualToCGFloat(actualRed, expectedRed);
        BOOL isGreenEqual = noc_isCGFloatEqualToCGFloat(actualGreen, expectedGreen);
        BOOL isBlueEqual = noc_isCGFloatEqualToCGFloat(actualBlue, expectedBlue);
        BOOL isAlphaEqual = noc_isCGFloatEqualToCGFloat(actualAlpha, expectedAlpha);
        
        return (isRedEqual && isGreenEqual && isBlueEqual && isAlphaEqual);
    });
    
    failureMessageForTo(^NSString *{
        if (actualIsNil) {
            return @"the actual value is nil/null";
        }
        if (expectedIsNil) {
            return @"the expected value is nil/null";
        }
        
        return [NSString stringWithFormat:@"expected: same RGBA values of %@ and %@, "
                "got: actual R=%.4f,G=%.4f,B=%.4f,A=%.4f, \nwhich are not equal to expected R=%.4f,G=%.4f,B=%.4f,A=%.4f",
                [expected class], [actual class], actualRed, actualGreen, actualBlue, actualAlpha, expectedRed, expectedGreen, expectedBlue, expectedAlpha];
    });
    
    failureMessageForNotTo(^NSString *{
        if (actualIsNil) {
            return @"the actual value is nil/null";
        }
        if (expectedIsNil) {
            return @"the expected value is nil/null";
        }
        
        return [NSString stringWithFormat:@"expected: different RGBA values of %@ and %@, "
                "got: actual R=%.4f,G=%.4f,B=%.4f,A=%.4f, \nwhich are equal to expected R=%.4f,G=%.4f,B=%.4f,A=%.4f",
                [expected class], [actual class], actualRed, actualGreen, actualBlue, actualAlpha, expectedRed, expectedGreen, expectedBlue, expectedAlpha];
    });
}

EXPMatcherImplementationEnd