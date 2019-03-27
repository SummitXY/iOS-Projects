//
//  CoreDataListTableViewController.m
//  StudentSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "CoreDataListTableViewController.h"

@interface CoreDataListTableViewController (){
    NSMutableArray* coreDataList;
}
@property (nonatomic,strong) AppDelegate* appDelegate;
//@property (nonatomic,strong) NSMutableArray* coreDataList;
@property (nonatomic,strong) NSMutableArray* test;
@end

@implementation CoreDataListTableViewController

//MARK:- property func
- (AppDelegate *)appDelegate{
    if (!_appDelegate) {
        _appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

//- (NSMutableArray *)coreDataList{
//    if (!_coreDataList) {
//        _coreDataList = [[NSMutableArray alloc]init];
//    }
//    return _coreDataList;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    
    
   
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    //[self.tableView reloadData];
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student"               inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age=12"];
    //[request setPredicate:predicate];
    NSArray *resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
    
    coreDataList = resultArray;
    
    //[self.coreDataList removeObjectAtIndex:0];
    
    [self.tableView reloadData];
    //NSLog(@"coreDataList length: %d",[self.coreDataList count]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [coreDataList count];
    //return [self.coreDataList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coreDataListCell" forIndexPath:indexPath];
    
    Student* studentContent = coreDataList[indexPath.row];
    NSString* cellLabelContent = [NSString stringWithFormat:@"%@ %d",studentContent.name,studentContent.age];
    cell.textLabel.text = cellLabelContent;
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"踢了TA鸭";
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;

    NSEntityDescription *entityStudent = [NSEntityDescription entityForName:@"Student"               inManagedObjectContext:appDelegate.persistentContainer.viewContext];

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityStudent];
    NSString* filterName = [[NSString alloc]initWithFormat:@"name=%@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",filterName];
    [request setPredicate:predicate];
    NSArray *resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];

        if (resultArray.count>0) {
            for (Student *stu in resultArray) {
                ///删除实体
                [appDelegate.persistentContainer.viewContext deleteObject:stu];
            }
            ///保存结果并且打印
            [appDelegate saveContext];
            NSLog(@"删除年龄为10的学生完成");
        }else{
            NSLog(@"没有符合条件的结果");
        }
    
    [coreDataList removeObjectAtIndex:indexPath.row];
    
    [tableView reloadData];
    
}




@end
