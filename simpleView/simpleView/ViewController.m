//
//  ViewController.m
//  simpleView
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSMutableArray<NSString*>* dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView* tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    NSArray* firstPage = [self generateData:0];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(NSArray*) generateData:(NSInteger)pageIndex{
    NSInteger begin = pageIndex*10;
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:10];
    for (NSInteger i = begin; i < begin+10; i++) {
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellID = @"cellID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    } else {
        cell = [UITableViewCell alloc]initwith
    }
}



@end
