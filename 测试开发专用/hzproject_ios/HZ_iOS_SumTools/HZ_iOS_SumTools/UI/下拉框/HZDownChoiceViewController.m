//
//  HZDownChoiceViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "HZDownChoiceViewController.h"
#import "DatePickView.h"
#import "BlocksKit+UIKit.h"
#import "MyYPickView.h"
#import "xialaTableView.h"
@interface HZDownChoiceViewController ()

@end

@implementation HZDownChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn =[Tools initWithNormalFrame:CGRectMake((ScreenWidth-80)/2, 100, 80, 30) ButtonWithText:@"拉时间选择" andfont:[UIFont systemFontOfSize:15] andImage:nil andSelectImage:nil];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn bk_addEventHandler:^(id sender) {
        
        DatePickView *date = [[DatePickView alloc]initWithFrame:self.view.frame andIfGetLastMonth:YES];
        [date setResult:^(NSString *dateStr) {
            //日期回调
            //        [startTimeBtn setTitle:dateStr forState:UIControlStateNormal];
            //        //日期转换
            //        startTimeStr = [self fomaterDateChange:dateStr];
            
        }];
        [self.view addSubview:date];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 =[Tools initWithNormalFrame:CGRectMake((ScreenWidth-120)/2, 150, 120, 30) ButtonWithText:@"下拉选择" andfont:[UIFont systemFontOfSize:15] andImage:nil andSelectImage:nil];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 bk_addEventHandler:^(id sender) {
        MyYPickView *view =[[MyYPickView alloc]initWithDataArr:@[@"华正1号",@"华正2号",@"华正3号",@"华正4号",@"华正5号",@"华正6号"]];
        
        [view setResult:^(NSString *select, NSInteger num) {
            
        }];
        [self.view addSubview:view];
       
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 =[Tools initWithNormalFrame:CGRectMake((ScreenWidth-120)/2, 200, 120, 30) ButtonWithText:@"下拉选择" andfont:[UIFont systemFontOfSize:15] andImage:nil andSelectImage:nil];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 bk_addEventHandler:^(id sender) {
       xialaTableView *xia = [xialaTableView creatNewViewWithFrame:CGRectMake(100, 200, 100, 250) contentData:@[@"华正1号",@"华正2号",@"华正3号",@"华正4号",@"华正5号",@"华正6号"] modelArr:nil OnView:self.view];
        [xia setResult:^(NSString *didslect , NSArray *arr, NSInteger num) {
            
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];


}

@end
