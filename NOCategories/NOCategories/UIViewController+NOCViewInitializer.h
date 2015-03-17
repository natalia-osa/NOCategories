//
//  UIViewController+NOCViewInitializer.h
//  NOCategories
//
//  Created by Patryk Kaczmarek on 16/03/15.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NOCViewInitializer)

/**
 *  Creates the view with specified class that the controller manages and assigns it to the view property.
 *  By default initlalized view will fill screen area (i.e. entire screen minus status bar if visible)
 *
 *  @param aClass The class of view to initialize. Has to be subclass of UIView class.
 *
 *  @return Instance of view (if initialized successful), nil otherwise.
 */
- (id)noc_loadViewOfClass:(Class)aClass;

/**
 *  Creates the view with specified class that the controller manages and assigns it to the view property.
 *
 *  @param aClass The class of view to initialize. Has to be subclass of UIView class.
 *  @param frame  The frame rectangle for the initialized view, measured in points.
 *
 *  @return Instance of view (if initialized successful), nil otherwise.
 */
- (id)noc_loadViewOfClass:(Class)aClass frame:(CGRect)frame;

@end
