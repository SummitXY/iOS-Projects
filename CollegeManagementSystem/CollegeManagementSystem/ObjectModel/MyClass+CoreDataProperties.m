//
//  MyClass+CoreDataProperties.m
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
//

#import "MyClass+CoreDataProperties.h"

@implementation MyClass (CoreDataProperties)

+ (NSFetchRequest<MyClass *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"MyClass"];
}

@dynamic name;
@dynamic students;
@dynamic teacher;

@end
