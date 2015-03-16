//
//  NOCExampleViewController.m
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCExampleViewController.h"
#import "NOCExampleView.h"

#import "NOCMacros.h"
#import "UIViewController+NOCViewInitializer.h"

@interface NOCExampleViewController ()

@property (nonatomic, weak, readonly) NOCExampleView *aView;

@end

typedef NS_ENUM(NSUInteger, NOCDifficulty)  {
    NOCDifficultySimple = 1 << 0,
    NOCDifficultyMedium = 1 << 1,
    NOCDifficultyHard = 1 << 2,
};

@implementation NOCExampleViewController

- (void)loadView {
    _aView = [self loadViewOfClass:[NOCExampleView class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // USING STRING MACROS
    [self.aView.demoLabel setText:noc_lString(@"This is very long text\nwith new line esapes\nand dynamic size.\n\nThe red bg should show\nyou the size of the label.\nIt should fit the text.", nil)];
    
    // USING WARNING MACROS
    noc_warnHack("You can add warnings this way. Then enable warnings as errors in your project configuration and write clean code.")
    // to do it, open project settings -> target -> build settings; search for "Treat Warnings as Errors"
    
    // USING MATH
    // You should never compare floats etc via ==.
    // to treat it as an error, open project settings -> target -> build settings; search for "Other Warning Flags"; paste "-Wfloat-equal".
    if (noc_isFloatEqual(1.f, 1.0)) {
        NSLog(@"Float and double are equal");
    }
    
    // USING COLORS
    // your graphic supplied colors as hex or rgbs?
    [self.view setBackgroundColor:noc_rgbToColor(255.f, 251.f, 136.f, 1.f)];
    [self.aView.demoLabel setBackgroundColor:noc_hexToColor(0xAE323b, 1.f)];
    
    // USING FLAG MACROS
    int flags = 0; // default
    noc_setBitOne(flags, NOCDifficultyHard);
    noc_setBitOne(flags, NOCDifficultySimple);
    NSLog(@"flags = %i %i %i", noc_isBitOne(flags, NOCDifficultySimple), noc_isBitOne(flags, NOCDifficultyMedium), noc_isBitOne(flags, NOCDifficultyHard));
}

@end
