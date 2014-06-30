//
//  SidebarViewController.h
//  iAF
//
//  Created by Tran Thien Khiem on 6/30/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidebarViewController : UIViewController

- (void) setViewController: (UIViewController *) viewController;
- (void) showMenu:(BOOL) isShown;
- (IBAction) toogleMenu:(id) sender;

@end
