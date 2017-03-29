//
//  Basic_AnimatedViewController8.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Basic_AnimatedViewController8.h"

@interface Basic_AnimatedViewController8 ()

@property (nonatomic,strong) UIView *greenView;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;

@property (nonatomic,assign) NSInteger padding;
@property (nonatomic, assign) BOOL animating;
@property (nonatomic, strong) NSMutableArray *animatableConstraints;

@end

@implementation Basic_AnimatedViewController8

-(void)loadView
{
    [super loadView];
    self.greenView = [[UIView alloc]init];
    self.redView   = [[UIView alloc]init];
    self.blueView  = [[UIView alloc]init];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _greenView.backgroundColor = UIColor.greenColor;
    _redView.backgroundColor   = UIColor.redColor;
    _blueView.backgroundColor  = UIColor.blueColor;
    
    NSInteger padding = self.padding = 10;
    _animatableConstraints = [NSMutableArray array];
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(_padding,_padding,_padding,_padding); // 一开始 green,red,blue的尺寸 再通过约束来改变
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加约束的同时添加到数组
        [_animatableConstraints addObjectsFromArray:@[
                                                      make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(), // 优先级低
                                                      make.bottom.equalTo(_blueView.mas_top).offset(-padding),    // green bottom 相对 blue top -10
                                                      ]];
        make.size.equalTo(_redView); // 大小 = redView
        make.height.equalTo(_blueView); // 高 = blue
    }];
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加约束的同时添加到数组
        [_animatableConstraints addObjectsFromArray:@[
                                                      make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(), // 优先级低
                                                      make.left.equalTo(_greenView.mas_right).offset(padding), // left 红色 green right  10
                                                      make.bottom.equalTo(_blueView.mas_top).offset(-padding), // bottom  蓝色 top -10
                                                      ]];
        make.size.equalTo(_greenView); // 大小 = green
        make.height.equalTo(_blueView.mas_height); // 高 = blue
    }];
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 添加约束的同时添加到数组
        [self.animatableConstraints addObjectsFromArray:@[
                                                          make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(), // 优先级低
                                                          ]];
        make.height.equalTo(_greenView);
    }];
    [self.view layoutIfNeeded];
    
    // 可以注释此部分，查看没有动画时的效果
    if (self.view) {
        _animating = YES;
        [self animateWithInvertedInsets:NO];
    }
    
    // Do any additional setup after loading the view.
}

- (void)animateWithInvertedInsets:(BOOL)invertedInsets {
    if (!_animating) return; // 是否需要动画
    NSInteger padding = invertedInsets ? 100 : _padding; // Yes 就缩小100 否 10
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in _animatableConstraints) {
        constraint.insets = paddingInsets;
    }
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self animateWithInvertedInsets:!invertedInsets]; // 取相反值无限循环执行动画
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
