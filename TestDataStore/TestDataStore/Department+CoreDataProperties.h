//
//  Department+CoreDataProperties.h
//  TestDataStore
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
//

#import "Department+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *createData;
@property (nullable, nonatomic, copy) NSString *departName;
@property (nullable, nonatomic, retain) NSSet<Employee *> *employee;

@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeeObject:(Employee *)value;
- (void)removeEmployeeObject:(Employee *)value;
- (void)addEmployee:(NSSet<Employee *> *)values;
- (void)removeEmployee:(NSSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
