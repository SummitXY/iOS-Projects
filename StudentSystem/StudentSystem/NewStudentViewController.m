//
//  NewStudentViewController.m
//  StudentSystem
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "NewStudentViewController.h"
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Student+CoreDataProperties.h"

@interface NewStudentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputNameField;
@property (weak, nonatomic) IBOutlet UITextField *inputAgeField;

@end

@implementation NewStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addNewStudent:(id)sender {
    AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    Student* entityStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    
    entityStudent.name = self.inputNameField.text;
    entityStudent.age = self.inputAgeField.text.integerValue;
    
    [appDelegate saveContext];
    NSLog(@"成功插入新学生：%@，%d",self.inputNameField.text,self.inputAgeField.text.integerValue);
    
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
