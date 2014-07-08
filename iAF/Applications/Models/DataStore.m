//
//  DataStore.m
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "DataStore.h"

@interface DataStore()
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;


@end

@implementation DataStore

- (id) init
{
    self = [super init];
    return self;
}

//
//
- (NSManagedObject *) create: (Class) objectClass
{
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(objectClass) inManagedObjectContext:self.context];
}

//
// save an object
//
- (void) save:(NSManagedObject *)object
{
    NSError *error = nil;
    [self.context insertObject:object];
    [self.context save:&error];
    
    if (error)
    {
        NSLog(@"Error Inserting Object: %@", error.description);
    }
    
    NSLog(@"Save Item Successful");
}

- (NSManagedObject *) fetch: (NSFetchRequest *) fetchRequest
{
    NSArray *items = [self fetchAll:fetchRequest];
    NSManagedObject *result = NULL;
    
    if ([items count])
    {
        result = [items objectAtIndex:0];
    }
    
    return result;
}

//
// Create a fetch request to get list of classes
//
- (NSFetchRequest *) fetchRequestWithClass: (Class) objectClass
{
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:NSStringFromClass(objectClass)
                inManagedObjectContext:self.context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    return request;
}

//
// Fetch all object
//
- (NSArray *) fetchAll: (NSFetchRequest *) fetchRequest
{
    NSError *error = NULL;
    NSArray *items = [self.context executeFetchRequest:fetchRequest error:&error];
    return items;
}


- (NSManagedObjectContext *) context
{
    if (!_context)
    {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        _context = [[NSManagedObjectContext alloc] init];
        [_context setPersistentStoreCoordinator:coordinator];
    }
    
    return _context;
}


//
// Return the managed object model
//
- (NSManagedObjectModel *) managedObjectModel
{
    if (!_managedObjectModel)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataStore" withExtension:@"momd"];
        
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    
    return _managedObjectModel;
}

//
// Create the persistent Store Coordinator
//
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator)
    {
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DataStore.sqlite"];
        NSError *error = nil;
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil URL:storeURL
                                                             options:nil
                                                               error:&error])
        {
            NSLog(@"Couldn't initialize database %@", error.description);
            abort();
        }
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Singleton instance
//
// get the shared instance
//
+ (DataStore *) sharedInstance
{
    static DataStore *instance;
    if (instance == NULL)
    {
        instance = [[DataStore alloc] init];
    }
    return instance;
}
@end
