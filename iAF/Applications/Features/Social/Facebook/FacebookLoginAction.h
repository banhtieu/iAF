//
//  FacebookLoginAction.h
//  iAF
//
//  Created by Tran Thien Khiem on 6/27/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FacebookLoginDelegate <NSObject>
- (void) facebookSignInWithUser: (NSDictionary *) user;
- (void) facebookSignInCancelled;
@end

@interface FacebookLoginAction : NSObject

@property (nonatomic, retain) id<FacebookLoginDelegate> delegate;

- (void) signInFacebook;

@end
