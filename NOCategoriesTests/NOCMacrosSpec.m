//
//  NOCMacrosSpec.m
//  NOCategoriesTests
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCMacros.h"
#import "EXPMatcher+UIColor.h"

SpecBegin(NOCMacrosSpec)

describe(@"NOCMacros", ^{
    
    describe(@"when comparing CGFloats", ^{
        CGFloat actualValue = 0.5f,  sameValue = 0.5, smallerValue = 0.4999, biggerValue = 0.5001;
        
        describe(@"checking equality should return", ^{
            it(@"YES for same values", ^{
                expect(noc_isCGFloatEqualToCGFloat(sameValue, actualValue)).to.beTruthy();
            });
            it(@"NO for smaller value", ^{
                expect(noc_isCGFloatEqualToCGFloat(smallerValue, actualValue)).to.beFalsy();
            });
            it(@"NO for bigger value", ^{
                expect(noc_isCGFloatEqualToCGFloat(biggerValue, actualValue)).to.beFalsy();
            });
        });
        
        describe(@"with X < Y function should return", ^{
            it(@"NO if X == Y", ^{
                expect(noc_isCGFloatLessThanCGFloat(sameValue, actualValue)).to.beFalsy();
            });
            it(@"YES if X < Y", ^{
                expect(noc_isCGFloatLessThanCGFloat(smallerValue, actualValue)).to.beTruthy();
            });
            it(@"NO if X > Y", ^{
                expect(noc_isCGFloatLessThanCGFloat(biggerValue, actualValue)).to.beFalsy();
            });
        });
        
        describe(@"with X <= Y function should return", ^{
            it(@"YES if X == Y", ^{
                expect(noc_isCGFloatLessOrEqualToCGFloat(sameValue, actualValue)).to.beTruthy();
            });
            it(@"YES if X < Y", ^{
                expect(noc_isCGFloatLessOrEqualToCGFloat(smallerValue, actualValue)).to.beTruthy();
            });
            it(@"NO if X > Y", ^{
                expect(noc_isCGFloatLessOrEqualToCGFloat(biggerValue, actualValue)).to.beFalsy();
            });
        });
        
        describe(@"with X > Y function should return", ^{
            it(@"NO if X == Y", ^{
                expect(noc_isCGFloatMoreThanCGFloat(sameValue, actualValue)).to.beFalsy();
            });
            it(@"NO if X < Y", ^{
                expect(noc_isCGFloatMoreThanCGFloat(smallerValue, actualValue)).to.beFalsy();
            });
            it(@"YES if X > Y", ^{
                expect(noc_isCGFloatMoreThanCGFloat(biggerValue, actualValue)).to.beTruthy();
            });
        });
        
        describe(@"with X >= Y function should return", ^{
            it(@"YES if X == Y", ^{
                expect(noc_isCGFloatMoreOrEqualToCGFloat(sameValue, actualValue)).to.beTruthy();
            });
            it(@"NO if X < Y", ^{
                expect(noc_isCGFloatMoreOrEqualToCGFloat(smallerValue, actualValue)).to.beFalsy();
            });
            it(@"YES if X > Y", ^{
                expect(noc_isCGFloatMoreOrEqualToCGFloat(biggerValue, actualValue)).to.beTruthy();
            });
        });
    });
    
    describe(@"when working with bit values", ^{
        __block NSInteger bitNumber;
        
        typedef NS_ENUM(NSUInteger, NOCTestEnum)  {
            NOCTestEnumZero = 1 << 0,
            NOCTestEnumOne = 1 << 1,
            NOCTestEnumTwo = 1 << 2,
        };
        
        it(@"setting 2nd bit as 1 should result with 4", ^{
            bitNumber = 0;
            noc_setBitOne(bitNumber, NOCTestEnumTwo);
            expect(bitNumber).to.equal(4);
        });
        
        it(@"setting a number of 4 and setting 2nd bit as 0 should result with 0", ^{
            bitNumber = 4;
            noc_setBitZero(bitNumber, NOCTestEnumTwo);
            expect(bitNumber).to.equal(0);
        });
        
        context(@"checking bit value of number 2 should result with", ^{
            beforeEach(^{
                bitNumber = 2;
            });
            
            it(@"0 in first bit", ^{
                expect(noc_isBitOne(bitNumber, NOCTestEnumZero)).to.equal(0);
            });
            it(@"0 in second bit", ^{
                expect(noc_isBitOne(bitNumber, NOCTestEnumOne)).to.equal(1);
            });
            it(@"1 in third bit", ^{
                expect(noc_isBitOne(bitNumber, NOCTestEnumTwo)).to.equal(0);
            });
        });
    });
    
    describe(@"when converting angles from", ^{
        it(@"radians to degreess, should return appropriate value", ^{
            expect(noc_radians(90)).to.beCloseToWithin(1.57, 0.001);
        });
        it(@"degress to radians, should return appropriate value", ^{
            expect(noc_degrees(1.57)).to.beCloseToWithin(90.0, 0.1);
        });
        it(@"degrees(radians(degrees)), should return equal value to degrees", ^{
            CGFloat degrees = 273;
            expect(noc_degrees(noc_radians(degrees))).to.beCloseToWithin(degrees, FLT_EPSILON);
        });
    });
   
    context(@"when creating colors from RGBA function", ^{
        __block CGFloat red = 1, green = 211, blue = 37, alpha = 1;
        __block UIColor *actualColor;
        
        beforeEach(^{
            actualColor = noc_rgbToColor(red, green, blue, alpha);
        });

        it(@"it should not be nil", ^{
            expect(actualColor).toNot.beNil();
        });
        it(@"RGBA values of new color should be equal to input RGBA values", ^{
            UIColor *expectedColor = [UIColor colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:alpha];
            expect(actualColor).to.beSameColor(expectedColor);
        });
    });
    
    context(@"when creating colors from HEX function", ^{
        __block CGFloat red = 72, green = 61, blue = 139, alpha = 1;
        __block UIColor *actualColor;
        
        beforeEach(^{
            actualColor = noc_hexToColor(0x483D8B , 1.0);
        });
        
        it(@"it should not be nil", ^{
            expect(actualColor).toNot.beNil();
        });
        it(@"RGBA values of new color should be equal to RGBA values of HEX color", ^{
            UIColor *expectedColor = [UIColor colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:alpha];
            expect(actualColor).to.beSameColor(expectedColor);
        });
    });
    
});

SpecEnd
