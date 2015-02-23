//
//  NOCExampleViewController.m
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCExampleViewController.h"
#import "NOCExampleView.h"

@interface NOCExampleViewController ()

@property (nonatomic, weak, readonly) NOCExampleView *aView;

@end

@implementation NOCExampleViewController

- (void)loadView {
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    NOCExampleView *view = [[NOCExampleView alloc] initWithFrame:rect];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    
    // local for easier access
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.aView.demoLabel setText:NSLocalizedString(@"This is very long text\nwith new line esapes\nand dynamic size.\n\nThe red bg should show\nyou the size of the label.\nIt should fit the text.", nil)];
}

@end
