//
//  ViewController.m
//  StudentSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Student+CoreDataProperties.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//
//    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
//
//    stu.name = [NSString stringWithFormat:@"学生%d",arc4random()%10];
//    stu.age = arc4random()%15;
//
//    NSLog(@"增加了一个学生 名字是:%@ 年龄是:%hd",stu.name,stu.age);
//
//    [appDelegate saveContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student"               inManagedObjectContext:appDelegate.persistentContainer.viewContext];

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age=12"];
    //[request setPredicate:predicate];
    NSArray *resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];

    for (Student *stu in resultArray) {
        NSLog(@"查询到一个学生 名字是:%@  年龄是:%hd",stu.name,stu.age);
    }
    
//    if (resultArray.count>0) {
//        for (Student *stu in resultArray) {
//            ///删除实体
//            [appDelegate.persistentContainer.viewContext deleteObject:stu];
//        }
//        ///保存结果并且打印
//        [appDelegate saveContext];
//        NSLog(@"删除年龄为10的学生完成");
//    }else{
//        NSLog(@"没有符合条件的结果");
//    }
  
    
    
    

    
  
}


@end
