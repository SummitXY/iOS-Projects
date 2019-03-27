//
//  CollegeManager.m
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "CollegeManager.h"
#import "AppDelegate.h"

static CollegeManager* _sharedManager = nil;

@implementation CollegeManager{
    AppDelegate* appDelegate;
    NSManagedObjectContext* appContext;
}

+ (CollegeManager*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (id)init{
    self = [super init];
    appDelegate = [[UIApplication sharedApplication] delegate];
    appContext = [appDelegate managedObjectContext];
    return self;
}

- (void)save{
    [appDelegate saveContext];
}

- (void)deleteEntity:(NSManagedObject*)obj{
    [appContext deleteObject:obj];
    [self save];
}
@end
