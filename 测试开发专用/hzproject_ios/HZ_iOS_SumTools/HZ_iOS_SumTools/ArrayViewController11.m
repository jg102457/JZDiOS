//
//  ArrayViewController11.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ArrayViewController11.h"

static CGFloat const kArrayExampleIncrement = 10.0;

@interface ArrayViewController11 ()

@property (nonatomic,strong) UIView   *line;
@property (nonatomic,strong) UIButton *raiseButton;
@property (nonatomic,strong) UIButton *centerButton;
@property (nonatomic,strong) UIButton *lowerButton;

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) NSArray *buttonViews;

@end

@implementation ArrayViewController11

-(void)loadView
{
    [super loadView];
    _line         = [[UIView alloc]init];
    _raiseButton  = [UIButton buttonWithType:UIButtonTypeSystem];
    _centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _lowerButton  = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.view addSubview:_line];
    [self.view addSubview:_raiseButton];
    [self.view addSubview:_centerButton];
    [self.view addSubview:_lowerButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _line.backgroundColor = [UIColor redColor];
    [_raiseButton setTitle:@"Raise" forState:UIControlStateNormal];
    [_centerButton setTitle:@"Center" forState:UIControlStateNormal];
    [_lowerButton setTitle:@"Lower" forState:UIControlStateNormal];
    [_raiseButton addTarget:self action:@selector(raiseAction) forControlEvents:UIControlEventTouchUpInside];
    [_centerButton addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchUpInside];
    [_lowerButton addTarget:self action:@selector(lowerAction) forControlEvents:UIControlEventTouchUpInside];
    // 添加跟中线，方便查看按钮的移动
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@1);
        make.center.equalTo(self.view);
    }];
    [_raiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.0);
    }];
    
    [_centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
    }];
    
    [_lowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-10);
    }];
    self.buttonViews = @[_raiseButton, _lowerButton, _centerButton];
    
    // Do any additional setup after loading the view.
}


- (void)centerAction {
    self.offset = 0.0;
}

- (void)raiseAction {
    self.offset -= kArrayExampleIncrement;
}

- (void)lowerAction {
    self.offset += kArrayExampleIncrement;
}

- (void)setOffset:(CGFloat)offset {
    _offset = offset;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)updateViewConstraints {
    // 同时更新多个按钮的约束
    [self.buttonViews mas_updateConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(self.view.mas_centerY).with.offset(self.offset); // buttonViews的底线
    }];
    [super updateViewConstraints];
    
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
