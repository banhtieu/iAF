//
//  UICustomizeTitleBar.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/27/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "UICustomize.h"

@implementation UICustomize

+ (void) customizeTitlebar
{

#ifdef TOP_BAR_IMAGE
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:TOP_BAR_IMAGE] forBarMetrics:UIBarMetricsDefault];
#endif
    
#ifdef TOP_BAR_TEXT_COLOR
    [[UINavigationBar appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:
            TOP_BAR_TEXT_COLOR, NSForegroundColorAttributeName, nil]];
#endif
    
    
}
@end
