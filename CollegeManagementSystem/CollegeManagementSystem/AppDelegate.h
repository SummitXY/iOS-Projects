//
//  AppDelegate.h
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

