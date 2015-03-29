[![Version](https://cocoapod-badges.herokuapp.com/v/NOCategories/badge.png)](http://cocoadocs.org/docsets/NOCategories) 
[![Platform](https://cocoapod-badges.herokuapp.com/p/NOCategories/badge.png)](http://cocoadocs.org/docsets/NOCategories) 
![License](https://img.shields.io/badge/license-Apache_2-green.svg?style=flat)

# NOCategories
A set of convenience categories.
## NSString+NOCSize:
In your view layoutSubviews method simply put:
```objective-c
CGSize demoLabelSize = [self.demoLabel.text noc_backwardCompatibleSizeWithFont:self.demoLabel.font constrainedToSize:frame.size];
[self.demoLabel setFrame:CGRectMake(originX,
                                    originY,
                                    demoLabelSize.width,
                                    demoLabelSize.height)];
```

## UIViewController+NOCViewInitializer:
To load your custom view class manually and assign instance of this view to UIViewController's view property, simply put in loadView method 
```objective-c
- (void)loadView {
    _aView = [self noc_loadViewOfClass:[NOCExampleView class]];  //_aView is @property of NOCExampleView class stored locally for easier access
}
```

## Macros + functions
###Warnings
The less real warnings in your project the better. Open project settings -> target -> build settings; search for "Treat Warnings as Errors" and set flag to YES. Then all warnings in project are treated as errors. You can write custom warnings this way (refer to the NOCMacros.h for more warnings):
```objective-c
noc_warnHack("You can add warnings this way. Then enable warnings as errors in your project configuration and write clean code.")
```
###String shortcuts.
I'm tired of writing NSString code, it's too long. So here are 3 methods to make it shorter (i'm not using comments
```objective-c
NSString *worldString = @"world";
// instead of LocalizedFormatted [NSString stringWithFormat:NSLocalizedString(@"hello %@!", nil), worldString] type:
noc_lfString(@"hello", worldString)
// instead of Formatted [NSString stringWithFormat:@"hello %@!", worldString] type:
noc_fString(@"hello", worldString)
// instead of Localized NSLocalizedString(m, nil) type:
noc_lString(@"hello")
```
If you're using genstrings, before generating it you need to replace defines to NSLocalizedString.
```bash
Find: noc_lString((@\"\w+\")) 
Replace: NSLocalizedString(\1, \1)
```
Now you can use genstrings. Then reset everything besides the localization files.
As for me this way is faster and more convenient to see, but if you don't like it - don't use it ^^.
### Bit operations
If you're having a variable and want to change bits inside but never remember the operations, just use:
```objective-c
typedef NS_ENUM(NSUInteger, NOCDifficulty)  { // you can use NS_OPTIONS instead
    NOCDifficultySimple = 1 << 0,
    NOCDifficultyMedium = 1 << 1,
    NOCDifficultyHard = 1 << 2,
};
int flags = 0;
noc_setBitOne(flags, NOCDifficultyHard);
noc_setBitZero(flags, NOCDifficultyHard);
noc_isBitOne(flags, NOCDifficultyHard)
```
### Comparing floats
You should never compare floats etc via ==, because the result can be misleading. To make sure you never implement such error, open project settings -> target -> build settings; search for "Other Warning Flags"; paste "-Wfloat-equal".
You can use convenience methods to compare floats:
```objective-c
if (noc_isCGFloatEqualToCGFloat(1.f, 1.0)) {
    NSLog(@"Float and double are equal");
}
```
### Fixing CGFloat warning with floor/ceil/round operations
Because CGFloat will be either float or double (depending on the architecture) you will receive warning in case you use either round or roundf. To silence it without casting (uglify code ;)) use:
```objective-c
noc_roundCGFloat(1.5)
```
### HEX (HTML) colors
Convenience method to decode hex color to UIColor.
```objective-c
[self.demoLabel setBackgroundColor:noc_hexToColor(0xAE323b, 1.f)];
```

Please refer to the demo for more in depth examples or check out source code.
## Installation:
#### Installation with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries.
```ruby
pod "NOCategories"
```
#### Submodule
In your projects git folder type:
```bash
git submodule init
git submodule add --copy link to the repo--
git submodule update
```
Copy all files from NOCategories/NOCategories folder.
#### Just download & attach
This is strongly misadvised as you won't be able to see code updates. Clone or download the source, copy all files from NOCategories folder.

## ChangeLog
- 0.4.1 Added degrees/radians functions. Added unit tests.
- 0.4.0 Added noc_round/floor/ceilCGFloat functions. Fixed an error from noc_isFloatMore and noc_isFloatLess functions.
- 0.3.0 Added UIViewController+NOCViewInitializer class.
- 0.2 Added macros, custom warnings, updated demo.
- 0.1 Added basic project, configured styling. Added demo and NSString+NOCSize class.

## Author

Natalia Osiecka, osiecka.n@gmail.com
- [Natalia Osiecka](https://github.com/natalia-osa/) ([@vivelee](https://twitter.com/vivelee))

## License

Available under the Apache 2.0 license. See the LICENSE file for more info.

## Requirements

Requires Xcode 6, targeting either iOS 5.1.1 or higher.
