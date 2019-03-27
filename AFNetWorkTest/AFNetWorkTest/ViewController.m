//
//  ViewController.m
//  AFNetWorkTest
//
//  Created by apple on 2019/3/27.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"

#define imageURL @"https://b-ssl.duitang.com/uploads/item/201903/05/20190305172433_Ercma.thumb.700_0.jpeg"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem* logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIBarButtonItem* firstItem = [[UIBarButtonItem alloc]initWithCustomView:[[NSBundle mainBundle] loadNibNamed:@"test" owner:nil options:nil]];
    
    
    self.navigationItem.leftBarButtonItems = @[logo,firstItem];
    
//    UIImageView* iv = [[UIImageView alloc]initWithFrame: self.view.bounds];
//    [self.view addSubview:iv];
    
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"image/jpeg"];
//
//    [manager GET:imageURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
//        NSLog(@"download successfully");
//        iv.image = [UIImage imageWithData:operation.responseData];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];

    //[iv sd_setImageWithURL:[NSURL URLWithString:imageURL]];

    
}


@end
