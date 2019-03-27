//
//  Course+CoreDataClass.h
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student, Teacher;

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Course+CoreDataProperties.h"
