//
//  DFViewController.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "DFViewController.h"
#import "UIView+Masonry_DF.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface DFViewController ()

@end

@implementation DFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //从此以后基本可以抛弃CGRectMake了
    UIView *sv = [[UIView alloc] init];
    //在做autoLayout之前 一定要先将view添加到superview上 否则会报错
    [self.view addSubview:sv];
    //mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //将sv居中(很容易理解吧?)
        make.center.equalTo(self.view);
        
        //将size设置成(300,300)
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
//    WS(ws);
//    
//    UIView *sv = [UIView new];
//   
    sv.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:sv];
//    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(ws.view);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor whiteColor];
    sv12.backgroundColor = [UIColor whiteColor];
    sv13.backgroundColor = [UIColor whiteColor];
    sv21.backgroundColor = [UIColor whiteColor];
    sv31.backgroundColor = [UIColor whiteColor];
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];

    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    
  //   Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
