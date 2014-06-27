//
//  LoginViewController.m
//  iAF
//
//  Created by Tran Thien Khiem on 6/27/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController()

@property(nonatomic, retain) IBOutlet UITextField *emailTextField;
@property(nonatomic, retain) IBOutlet UITextField *passwordTextField;

@end


@implementation LoginViewController

- (IBAction) onSignInClicked:(id)sender
{
    // @TODO: connect to server
}

- (void) onSignInWithFacebookUser:(NSDictionary *) facebookUser
{
    // @TODO: connect to server
}

- (void) onSignInWithTwitterUser:(NSDictionary *) twitterUser
{
    // @TODO: Connect to server with twitterID
}

@end
