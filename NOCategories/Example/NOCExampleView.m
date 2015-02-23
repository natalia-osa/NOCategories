//
//  NOCExampleView.m
//  NOCategories
//
//  Created by Natalia Osiecka on 23.2.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NOCExampleView.h"
#import "NSString+NOCSize.h"

@implementation NOCExampleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _demoLabel = [[UILabel alloc] init];
        [_demoLabel setBackgroundColor:[UIColor colorWithRed:1.f green:0.f blue:0.f alpha:0.25f]];
        [_demoLabel setNumberOfLines:0];
        [_demoLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_demoLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    CGSize demoLabelSize = [self.demoLabel.text noc_backwardCompatibleSizeWithFont:self.demoLabel.font constrainedToSize:frame.size];
    [self.demoLabel setFrame:CGRectMake(ceilf((CGRectGetMaxX(frame) - demoLabelSize.width) / 2.f),
                                        ceilf((CGRectGetMaxY(frame) - demoLabelSize.height) / 2.f),
                                        demoLabelSize.width,
                                        demoLabelSize.height)];
}

@end
