//
//  UISidebarItemSegue.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/30/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "UISidebarItemSegue.h"
#import "SidebarViewController.h"

@implementation UISidebarItemSegue

- (void) perform
{
    if ([self.sourceViewController isKindOfClass:[SidebarViewController class]])
    {
        SidebarViewController *sidebarViewController = self.sourceViewController;
        [sidebarViewController setViewController:self.destinationViewController];
    };
}

@end
