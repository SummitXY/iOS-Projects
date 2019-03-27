//
//  Department+CoreDataProperties.m
//  TestDataStore
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
//

#import "Department+CoreDataProperties.h"

@implementation Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Department"];
}

@dynamic createData;
@dynamic departName;
@dynamic employee;

@end
