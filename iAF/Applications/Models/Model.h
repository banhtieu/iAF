//
//  Model.h
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataStore.h"

@interface Model : NSObject

@property (nonatomic, retain) NSManagedObjectID *objectId;
@property (nonatomic, retain) NSDate *createAt;

- (id) init;
- (id) initWithObject: (id) object;

- (void) save:(void (^)(NSError* error)) handler;
- (void) remove:(void (^)(NSError *error)) handler;

@end
