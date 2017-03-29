//
//  BasicViewController1.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BasicViewController1.h"

@interface BasicViewController1 ()
@property (nonatomic) UIView *greenView;
@end

@implementation BasicViewController1


-(void)loadView
{
    [super loadView];
    _greenView = [[UIView alloc]init];
    [self.view addSubview:_greenView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _greenView.backgroundColor = [UIColor greenColor];
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));    // 设置大小
       // make.center.equalTo(self.view);                 // 居中显示
        make.center.mas_equalTo(self.view);
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
