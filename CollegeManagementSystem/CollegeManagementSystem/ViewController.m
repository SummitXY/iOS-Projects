//
//  ViewController.m
//  CollegeManagementSystem
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"
#import "ObjectModel/MyClass+CoreDataClass.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSMutableArray* arrMyClasses = [[NSMutableArray alloc] init];
    NSArray* arrMyClassesName = @[@"99级1班",@"99级2班",@"99级3班"];
    for (NSString* className in arrMyClassesName) {
        MyClass* newMyClass = [NSEntityDescription insertNewObjectForEntityForName:@"MyClass" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
        newMyClass.name = className;
        [arrMyClasses addObject:newMyClass];
    }
}


@end
