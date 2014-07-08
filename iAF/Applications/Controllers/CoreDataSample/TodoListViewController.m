//
//  TodoListViewController.m
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "TodoListViewController.h"
#import "DataStore.h"
#import "Item.h"

@interface TodoListViewController ()

@end

@implementation TodoListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Item *item = [[Item alloc] init];
    [item setName:@"Simple String"];
    [item save:^(NSError *error) {
        NSLog(@"Save completed with %@", error);
        NSLog(@"Object ID: %@", item.objectId);
    }];
    
}

@end
