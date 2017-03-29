//
//  Aspect_FitViewController7.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Aspect_FitViewController7.h"

@interface Aspect_FitViewController7 ()

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *topInnerView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *bottomInnerView;

@end

@implementation Aspect_FitViewController7

-(void)loadView
{
    [super loadView];
    self.topView            = [[UIView alloc] init];
    self.topInnerView       = [[UIView alloc] init];
    self.bottomView         = [[UIView alloc] init];
    self.bottomInnerView    = [[UIView alloc] init];
    [self.view addSubview:_topView];
    [self.view addSubview:_topInnerView];
    [self.view addSubview:_bottomView];
    [self.view addSubview:_bottomInnerView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.topView.backgroundColor            = [UIColor redColor];
    self.bottomView.backgroundColor         = [UIColor blueColor];
    self.topInnerView.backgroundColor       = [UIColor greenColor];
    self.bottomInnerView.backgroundColor    = [UIColor grayColor];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(self.view);     // 左边、右边、顶部 等于 self.View
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self.view);  // 左边、右边、底部 等于 self.View
        make.top.equalTo(self.topView.mas_bottom);      // 顶部 等于 topView 的 底部
        make.height.equalTo(self.topView);              // 高 等于 topView
        // 结果：上下55分成
    }];
    [self.topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.topInnerView.mas_height).multipliedBy(3);   // 宽度是高度的3倍
        make.width.and.height.lessThanOrEqualTo(self.topView);              // 宽度、高度 小于 topView的宽度高度
        make.width.and.height.equalTo(self.topView).with.priorityLow();     // 宽度、高度 等于 topView的宽度高度 优先级 低
        make.center.equalTo(self.topView);                                  // 中心点位置 等于 topView
    }];
    [self.bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.bottomInnerView.mas_width).multipliedBy(3);// 高度是宽度的3倍
        make.width.and.height.lessThanOrEqualTo(self.bottomView);           // 宽度、高度 小于 bottomView的宽度高度
        make.width.and.height.equalTo(self.bottomView).with.priorityLow();  // 宽度、高度 等于 bottonView的宽度高度 优先级 低
        make.center.equalTo(self.bottomView);                               // 中心点位置 等于 bottonView
    }];
    
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
