//
//  NOCAppDelegate.m
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCAppDelegate.h"
#import "NOCExampleViewController.h"

@interface NOCAppDelegate ()

@end

@implementation NOCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // create the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    // set root controller
    UIViewController *viewController = [[NOCExampleViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window setRootViewController:navigationController];
    
    // finish launching
    return YES;
}

@end
