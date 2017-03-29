//
//  JSPathDemoViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "JSPathDemoViewController.h"
#import "BlocksKit+UIKit.h"
#import "ViewController.h"
@interface JSPathDemoViewController ()

@end

@implementation JSPathDemoViewController{

    MyTextView *text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"JSPathDemo";
    text = [Tools intWithFrame:CGRectMake(20, 100, ScreenWidth-40, 100)  PlaceHoder:@"JSPath热修复代码" andfont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:text];
    
   UIButton *btn1 =[Tools initWithNormalFrame:CGRectMake((ScreenWidth-60)/2,300, 60, 30) ButtonWithText:@"热修复" andfont:[UIFont systemFontOfSize:15] andImage:nil andSelectImage:nil];
    [btn1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
//    [btn1 bk_addEventHandler:^(id sender) {
//
//
//
//    } forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
}
- (void)btnClick{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"热修复" object:text.text userInfo:nil];
    ViewController  *view =[[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
@end
