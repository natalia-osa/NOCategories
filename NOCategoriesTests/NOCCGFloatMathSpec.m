//
//  NOCCGFloatMathSpec.m
//  NOCategories
//
//  Created by Natalia Paula Osiecka on 26/07/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NOCCGFloatMath.h"

SpecBegin(NOCCGFloatMathSpec)

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

describe(@"when rounding CGFloats", ^{
    CGFloat centerValue = 0.5f, smallValue = 0.4, bigValue = 0.6, ceilValue = 1, floorValue = 0;
    
    describe(@"with round function should return", ^{
        it(@"YES if round(0.5) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_roundCGFloat(centerValue), ceilValue)).to.beTruthy();
        });
        it(@"NO if round(0.5) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_roundCGFloat(centerValue), floorValue)).to.beFalsy();
        });
        it(@"YES if round(0.4) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_roundCGFloat(smallValue), floorValue)).to.beTruthy();
        });
        it(@"YES if round(0.6) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_roundCGFloat(bigValue), ceilValue)).to.beTruthy();
        });
    });
    describe(@"with floor function should return", ^{
        it(@"YES if floor(0.5) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_floorCGFloat(centerValue), floorValue)).to.beTruthy();
        });
        it(@"NO if floor(0.5) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_floorCGFloat(centerValue), ceilValue)).to.beFalsy();
        });
        it(@"YES if floor(0.4) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_floorCGFloat(smallValue), floorValue)).to.beTruthy();
        });
        it(@"YES if floor(0.6) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_floorCGFloat(bigValue), floorValue)).to.beTruthy();
        });
    });
    describe(@"with ceil function should return", ^{
        it(@"YES if ceil(0.5) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_ceilCGFloat(centerValue), ceilValue)).to.beTruthy();
        });
        it(@"NO if ceil(0.5) == 0.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_ceilCGFloat(centerValue), floorValue)).to.beFalsy();
        });
        it(@"YES if ceil(0.4) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_ceilCGFloat(smallValue), ceilValue)).to.beTruthy();
        });
        it(@"YES if ceil(0.6) == 1.0", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_ceilCGFloat(bigValue), ceilValue)).to.beTruthy();
        });
    });
});

describe(@"when working on CGFloats", ^{
    describe(@"with taking absolute value should return", ^{
        it(@"YES if abs(0.5) == 0.5", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_CGFloatAbs(0.5), 0.5)).to.beTruthy();
        });
        it(@"NO if abs(-0.5) != 0.5", ^{
            expect(!noc_isCGFloatEqualToCGFloat(noc_CGFloatAbs(-0.5), 0.5)).to.beFalsy();
        });
        it(@"YES if abs(-2) == 2", ^{
            expect(noc_isCGFloatEqualToCGFloat(noc_CGFloatAbs(-2), 2)).to.beTruthy();
        });
        it(@"NO if abs(2) != 2", ^{
            expect(noc_isCGFloatEqualToCGFloat(!noc_CGFloatAbs(2), 2)).to.beFalsy();
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

SpecEnd