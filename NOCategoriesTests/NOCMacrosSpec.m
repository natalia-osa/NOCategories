//
//  NOCMacrosSpec.m
//  NOCategoriesTests
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCMacros.h"
#import "NOCCGFloatMath.h"
#import "EXPMatcher+UIColor.h"

SpecBegin(NOCMacrosSpec)

describe(@"NOCMacros", ^{
    
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
        
        describe(@"when working with flags", ^{
            NSInteger testNumber = 99;
            describe(@"number 99 (== 0110 0011), should", ^{
                it(@"return YES for bit 0 ON", ^{
                    expect(noc_isBitAtIndexOne(testNumber, 0)).to.equal(1);
                });
                it(@"return NO for bit 1 OFF", ^{
                    expect(noc_isBitAtIndexOne(testNumber, 1)).toNot.equal(0);
                });
                it(@"return YES for bit 2 OFF", ^{
                    expect(noc_isBitAtIndexOne(testNumber, 2)).to.equal(0);
                });
                it(@"return NO for bit 3 ON", ^{
                    expect(noc_isBitAtIndexOne(testNumber, 3)).toNot.equal(1);
                });
            });
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
