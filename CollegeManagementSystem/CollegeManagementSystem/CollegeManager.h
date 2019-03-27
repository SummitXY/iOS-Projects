//
//  CollegeManager.h
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollegeManager : NSObject

+ (CollegeManager*)sharedManager;
- (void)save;
- (void)deleteEntity:(NSManagedObject*)obj;

@end

NS_ASSUME_NONNULL_END
