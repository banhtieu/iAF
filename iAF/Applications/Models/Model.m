//
//  Model.m
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "Model.h"
#import "DataStore.h"
#import <objc/runtime.h>

@implementation Model

- (id) init
{
    self = [super init];
    self.createAt = [NSDate date];
    return self;
}

- (id) initWithObject: (id) object
{
    self = [super init];

    [Model copyObject:object toObject:self];
    
    return self;
}

- (void) save:(void (^)(NSError* error)) handler
{
    NSError *error = nil;
    DataStore *dataStore = [DataStore sharedInstance];
    
    NSManagedObject *managedObject = nil;
    
    // save locally
    
    if (!self.objectId)
    {
        managedObject = [NSEntityDescription
                         insertNewObjectForEntityForName:NSStringFromClass([self class])
                         inManagedObjectContext:dataStore.context];
    }
    else
    {
        managedObject = [dataStore.context objectWithID:self.objectId];
    }
    
    [Model copyObject:self toObject:managedObject];

    if ([dataStore.context hasChanges])
    {
        [dataStore.context save:&error];
    }
    
    self.objectId = [managedObject objectID];
    
    if (handler)
    {
        handler(error);
    }

}

- (void) remove:(void (^)(NSError *error)) handler
{
    
}

//
// Manually copy an object data to another object
+ (void) copyObject: (id) source toObject: (id) destination
{
    Class clazz = [destination class];
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    
    for (int i = 0; i < count ; i++) {
        
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        
        if ([source objectForKey:propertyName])
        {
            NSLog(@"Set %@ = %@", propertyName, [source objectForKey:propertyName]);
            [self setValue:[source objectForKey:propertyName] forKey:propertyName];
        }
    }
    
    free(properties);
}

@end
