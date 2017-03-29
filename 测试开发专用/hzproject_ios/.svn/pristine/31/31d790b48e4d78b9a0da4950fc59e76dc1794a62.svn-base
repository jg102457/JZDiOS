//
//  Using_ConstantsViewController5.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Using_ConstantsViewController5.h"

@interface Using_ConstantsViewController5 ()

@property (nonatomic,strong) UIView *purpleView;
@property (nonatomic,strong) UIView *orangeView;

@end

@implementation Using_ConstantsViewController5

-(void)loadView
{
    [super loadView];
    self.purpleView = [[UIView alloc]init];
    self.orangeView = [[UIView alloc]init];
    [self.view addSubview:_purpleView];
    [self.view addSubview:_orangeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.purpleView.backgroundColor = UIColor.purpleColor;
    self.orangeView.backgroundColor = UIColor.orangeColor;
    [self.purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);      // 顶 20 相对于self.View
        make.left.equalTo(@20);     // 左 20
        make.bottom.equalTo(@-20);  // 底 -20
        make.right.equalTo(@-20);   // 右 -20
    }];
    [self.orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 50)); // 中心点Y 相对于self.View Y 50
        make.size.mas_equalTo(CGSizeMake(200, 100)); // 大小 200 100
    }];
    
    // Do any additional setup after loading the view.
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
