//
//  Teacher+CoreDataProperties.m
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
//

#import "Teacher+CoreDataProperties.h"

@implementation Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Teacher"];
}

@dynamic courses;
@dynamic myClass;

@end
