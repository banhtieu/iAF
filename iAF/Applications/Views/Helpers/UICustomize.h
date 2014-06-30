//
//  UICustomizeTitleBar.h
//  iAF
//
//  Created by Tran Thien Khiem on 6/27/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import <Foundation/Foundation.h>

// This View Controller is used to customize
// The title bar
// comment properties you don't want to customize

#define UIColorFromARGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(rgbValue >> 24)/255.0]

#pragma mark Titlebar Customization
//#define TOP_BAR_IMAGE @"TopBar"
//#define TOP_BAR_TEXT_COLOR UIColorFromARGB(0xFFFFFFFF)


@interface UICustomize : NSObject

+ (void) customizeTitlebar;

@end
