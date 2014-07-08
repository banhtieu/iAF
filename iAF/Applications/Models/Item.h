//
//  Item.h
//  iAF
//
//  Created by Tran Thien Khiem on 7/1/14.
//  Copyright (c) 2014 Tran Thien Khiem. All rights reserved.
//

#import "Model.h"

@interface Item : Model

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *details;
@property (nonatomic) BOOL *finished;
@end
