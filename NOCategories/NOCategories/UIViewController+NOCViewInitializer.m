//
//  UIViewController+NOCViewInitializer.m
//  NOCategories
//
//  Created by Patryk Kaczmarek on 16/03/15.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "UIViewController+NOCViewInitializer.h"

@implementation UIViewController (NOCViewInitializer)

- (id)loadViewOfClass:(Class)aClass {
    return [self loadViewOfClass:aClass frame:[[UIScreen mainScreen] applicationFrame]];
}

- (id)loadViewOfClass:(Class)aClass frame:(CGRect)frame {
    
    if (![aClass isSubclassOfClass:[UIView class]]) {
        return nil;
    }
    
    UIView *view = [[aClass alloc] initWithFrame:frame];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.view = view;
    
    return view;
}

@end
