//
//  BasicViewController2.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BasicViewController2.h"

@interface BasicViewController2 ()

@property (nonatomic,strong) UIView *greenView;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;

@end

@implementation BasicViewController2


-(void)loadView
{
    [super loadView];
    _greenView = [[UIView  alloc]init];
    _redView   = [[UIView alloc]init];
    _blueView  = [[UIView alloc]init];
    [self.view addSubview:_greenView];
    [self.view addSubview:_redView];
    [self.view addSubview:_blueView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [_greenView setBackgroundColor:[UIColor greenColor]];
    [_redView   setBackgroundColor:[UIColor redColor]];
    [_blueView  setBackgroundColor:[UIColor blueColor]];
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(10);// 顶 等于 View 顶 +10
        make.left.equalTo(self.view).offset(10);// 左 等于 View 左 +10
        make.bottom.equalTo(_blueView.mas_top).offset(-10);// 底 等于 蓝色  顶 -10
        make.right.equalTo(_redView.mas_left).offset(-10);// 右 等于 红色  右 -10
        make.width.equalTo(_redView);// 宽 等于 红色  宽
        make.height.mas_equalTo(400); // 高 等于 红色  高
       // make.height.equalTo(_blueView);// 高 等于 蓝色  高
        
    }];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_greenView);// 顶 等于 绿色   顶
        make.left.equalTo(_greenView.mas_right).offset(10);// 左 等于 绿色   右 +10
        //make.bottom.equalTo(_greenView);// 底 等于 绿色   底
        make.right.equalTo(self.view).offset(-10);// 右 等于 View  右 -10
        make.width.equalTo(_greenView);// 宽 等于 绿色   宽
        make.height.equalTo(_blueView);// 高 等于 绿色   高
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_greenView.mas_bottom).offset(10);// 顶 等于 绿色   底 +10
        make.left.equalTo(self.view).offset(10);// 左 等于 View  左 +10
        make.bottom.equalTo(self.view).offset(-10);// 底 等于 View  底 -10
        make.right.equalTo(self.view).offset(-10); // 右 等于 View  右 -10
        make.height.equalTo(_blueView);// 高 等于 绿色   高
        
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
