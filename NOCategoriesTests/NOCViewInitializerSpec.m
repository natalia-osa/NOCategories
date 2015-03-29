//
//  NOCViewInitializerSpec.m
//  NOCategories
//
//  Created by Natalia Osiecka on 28.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "UIViewController+NOCViewInitializer.h"

//##OBJCLEAN_SKIP##
@interface NOCTestView : UIView @end
@implementation NOCTestView @end
//##OBJCLEAN_ENDSKIP##

SpecBegin(NOCViewInitializerSpec)

describe(@"NOCViewInitializer", ^{
    __block UIViewController *controller;
    
    beforeEach(^{
        controller = [[UIViewController alloc] init];
    });
    afterEach(^{
        controller = nil;
    });
    
    context(@"when controller loads view", ^{
        
        beforeEach(^{
            [controller noc_loadViewOfClass:[NOCTestView class]];
        });
        
        it(@"controller's view should not be nil", ^{
            expect(controller.view).toNot.beNil();
        });
        it(@"controller's view should be proper class", ^{
            expect(controller.view).to.beKindOf([NOCTestView class]);
        });
        
    });
});

SpecEnd
