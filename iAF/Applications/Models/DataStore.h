//
//  DataStore.h
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStore : NSObject

@property (nonatomic, retain) NSManagedObjectContext *context;

- (void) save: (NSManagedObject *) object;
- (NSManagedObject *) create: (Class) objectClass;
- (NSManagedObject *) fetch: (NSFetchRequest *) fetchRequest;
- (NSArray *) fetchAll: (NSFetchRequest *) fetchRequest;
- (NSFetchRequest *) fetchRequestWithClass: (Class) objectClass;

+ (DataStore *) sharedInstance;
@end
