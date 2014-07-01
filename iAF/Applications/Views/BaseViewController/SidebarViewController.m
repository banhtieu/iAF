//
//  SidebarViewController.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/30/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "SidebarViewController.h"
#import "UISidebarMenuSegue.h"

@interface SidebarViewController ()

@property (nonatomic, retain) IBOutlet UIView* menuContainer;
@property (nonatomic, retain) UIView* mainView;
@property (nonatomic, retain) UIViewController* currentViewController;
@property (nonatomic, retain) UINavigationController *mainNavigationController;
@property (nonatomic, retain) UITabBarController *mainTabbarController;
@property (nonatomic, retain) NSMutableArray *allViewControllers;
@property (nonatomic) BOOL isMenuShowing;

@end

@implementation SidebarViewController

//
// Did load the view
//
- (void) viewDidLoad
{
    self.mainTabbarController = [[UITabBarController alloc] init];
    self.mainNavigationController = [[UINavigationController alloc] initWithRootViewController:self.mainTabbarController];
    self.allViewControllers = [[NSMutableArray alloc] init];
    [self.mainTabbarController.tabBar setHidden:YES];

    self.mainView = self.mainNavigationController.view;
    
    [self.view addSubview:self.mainView];
    self.mainTabbarController.navigationItem.leftBarButtonItem = self.navigationItem.leftBarButtonItem;
    [self performSegueWithIdentifier:@"Main" sender:self];
    
    // add shadow
    CALayer *layer = self.mainView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

- (void) viewDidAppear:(BOOL)animated
{
    self.menuContainer.transform = CGAffineTransformMakeTranslation(250.0f, 0.0f);
}

//
// load view controller
//
- (void) setViewController: (UIViewController *) viewController
{
    if (self.presentedViewController != viewController)
    {
        self.currentViewController = viewController;
        [self.mainNavigationController popToRootViewControllerAnimated:NO];
        
        if ([self.allViewControllers indexOfObject:self.presentedViewController] == NSNotFound)
        {
            [self.allViewControllers addObject:viewController];
            [self.mainTabbarController setViewControllers:self.allViewControllers];
            self.mainTabbarController.selectedViewController = viewController;
        }
        else
        {
            self.mainTabbarController.selectedViewController = viewController;
        }
        
        [self.mainTabbarController setTitle:viewController.title];
    }
    
    if (self.isMenuShowing)
    {
        [self showMenu:NO];
    }
}

- (void) showMenu:(BOOL) isShown
{
    if (isShown)
    {
        [UIView animateWithDuration: 0.5f
                         animations:^{
                             CGAffineTransform scale = CGAffineTransformMakeScale(1.0f, 1.0f);
                             CGAffineTransform translation = CGAffineTransformMakeTranslation(250.0f, 0.0f);
                             self.mainView.transform = CGAffineTransformConcat(scale, translation);
                             self.mainView.alpha = 0.75f;
                             
                             self.menuContainer.alpha = 1.0f;
                             self.menuContainer.transform = CGAffineTransformIdentity;
                         }];
        self.isMenuShowing = true;
    }
    else
    {
        self.menuContainer.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration: 0.5f
                         animations:^{
                             CGAffineTransform scale = CGAffineTransformIdentity;
                             self.mainView.transform = scale;
                             self.mainView.alpha = 1.0f;
                             self.menuContainer.alpha = 0.5f;
                             self.menuContainer.transform = CGAffineTransformMakeTranslation(250.0f, 0.0f);                 }];
        
        self.isMenuShowing = false;
    }
}


- (IBAction) toogleMenu:(id) sender
{
    [self showMenu:!self.isMenuShowing];
}

@end
