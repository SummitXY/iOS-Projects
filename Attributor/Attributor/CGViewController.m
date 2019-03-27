//
//  CGViewController.m
//  Attributor
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "CGViewController.h"

@interface CGViewController ()

@end

@implementation CGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBezierPath* path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 150)];
    [path addLineToPoint:CGPointMake(100, 200)];
    
    [path closePath];
    
    [[UIColor greenColor]setFill];
    [[UIColor redColor]setStroke];
    
    [path fill];
    [path stroke];
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
