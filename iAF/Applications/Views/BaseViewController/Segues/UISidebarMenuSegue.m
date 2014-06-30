//
//  UISidebarMenuSegue.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/30/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "UISidebarMenuSegue.h"
#import "SidebarViewController.h"

@implementation UISidebarMenuSegue


- (id) initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    return self;
}

- (void) perform
{
    if ([self.destinationViewController isMemberOfClass:[SidebarViewController class]])
    {
        SidebarViewController *sidebarViewController = self.destinationViewController;
        [sidebarViewController toogleMenu:self];
    }
}

@end
