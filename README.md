[![Version](https://cocoapod-badges.herokuapp.com/v/NOCategories/badge.png)](http://cocoadocs.org/docsets/NOCategories) 
[![Platform](https://cocoapod-badges.herokuapp.com/p/NOCategories/badge.png)](http://cocoadocs.org/docsets/NOCategories) 

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
Please refer to the demo for more in depth example.
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
- 0.1 Added basic project, configured styling. Added demo and NSString+NOCSize class.

## Author

Natalia Osiecka, osiecka.n@gmail.com
Natalia Osiecka MobileSoftware

## License

Available under the Apache 2.0 license. See the LICENSE file for more info.

## Requirements

Requires Xcode 6, targeting either iOS 5.1.1 or higher.
