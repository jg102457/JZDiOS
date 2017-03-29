//
//  Attribute_ChainingViewController12.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Attribute_ChainingViewController12.h"

@interface Attribute_ChainingViewController12 ()
@property (nonatomic,strong) UIView *greenView;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;

@end

@implementation Attribute_ChainingViewController12

-(void)loadView
{
    [super loadView];
    _greenView = [[UIView alloc]init];
    _redView   = [[UIView alloc]init];
    _blueView  = [[UIView alloc]init];
    [self.view addSubview:_greenView];
    [self.view addSubview:_redView];
    [self.view addSubview:_blueView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 10, 15, 10);
    _greenView.backgroundColor = UIColor.greenColor;
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self.view).insets(padding);   // 顶部15 左边 10
        make.bottom.equalTo(_blueView.mas_top).insets(padding); // 底部与蓝色 15
        make.width.equalTo(_redView.mas_width);                 // 宽度与红色相等
        make.height.equalTo(@[_redView, _blueView]);            // 高度与红蓝相等
    }];
    _redView.backgroundColor = UIColor.redColor;
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.equalTo(self.view).insets(padding);  // 顶部15 右边 10
        make.left.equalTo(_greenView.mas_right).insets(padding);// 左边与绿色  10
        make.bottom.equalTo(_blueView.mas_top).insets(padding); // 底部与蓝色  15
        make.width.equalTo(_greenView.mas_width);               // 宽度与红色相等
        make.height.equalTo(@[_greenView, _blueView]);          // 高度与绿蓝相等
    }];
    _blueView.backgroundColor = UIColor.blueColor;
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_greenView.mas_bottom).insets(padding);  // 顶部绿色 15
        make.left.right.and.bottom.equalTo(self.view).insets(padding); // 左边 10 右边 10 底部 15
        make.height.equalTo(@[_greenView, _redView]);  // 高度与红绿相等
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
