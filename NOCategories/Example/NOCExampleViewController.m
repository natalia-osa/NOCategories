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
#import "NOCCGFloatMath.h"
#import "UIViewController+NOCViewInitializer.h"
#import "NSAttributedString+NOCSize.h"

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
    // save reference local for easier access
    _aView = [self noc_loadViewOfClass:[NOCExampleView class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // USING STRING MACROS
    [self.aView.demoLabel setText:noc_lString(@"This is very long text\nwith new line esapes\nand dynamic size.\n\nThe red bg should show\nyou the size of the label.\nIt should fit the text.", nil)];
    
    // Calculating string size (example of normal string in view class)
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15], NSForegroundColorAttributeName : [UIColor blueColor]};
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Attributed String1\n" attributes:attributes]];
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Attributed String2\n" attributes:attributes]];
    CGSize attrubutedStringSize = [attributedString noc_backwardCompatibleSizeConstrainedToSize:CGSizeMake(150, 200)];
    NSLog(@"attributed string size: %.2f, %.2f", attrubutedStringSize.width, attrubutedStringSize.height);
    
    // USING WARNING MACROS
    noc_warnHack("You can add warnings this way. Then enable warnings as errors in your project configuration and write clean code.")
    // to do it, open project settings -> target -> build settings; search for "Treat Warnings as Errors"
    
    // USING MATH
    // You should never compare floats etc via ==.
    // to treat it as an error, open project settings -> target -> build settings; search for "Other Warning Flags"; paste "-Wfloat-equal".
    if (noc_isCGFloatEqualToCGFloat(1.f, 1.0)) {
        NSLog(@"Float and double are equal");
    }
    NSLog(@"%.2f", noc_CGFloatAbs(-5));
    // Allows to quickly skip type check on floor ceil round without casting to desired type and without warnings.
    NSLog(@"%.1f, %.1f, %.1f", noc_floorCGFloat(1.9f), noc_roundCGFloat(1.5), noc_ceilCGFloat(7.1f));
    
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
