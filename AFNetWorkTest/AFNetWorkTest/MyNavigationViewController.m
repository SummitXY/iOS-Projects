//
//  MyNavigationViewController.m
//  AFNetWorkTest
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "MyNavigationViewController.h"
@interface MyNavigationViewController ()

@end

@implementation MyNavigationViewController

+ (void)initialize
{
    UINavigationBar* bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem* logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIBarButtonItem* firstItem = [[UIBarButtonItem alloc]initWithCustomView:[[NSBundle mainBundle] loadNibNamed:@"NavItem" owner:nil options:nil]];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
