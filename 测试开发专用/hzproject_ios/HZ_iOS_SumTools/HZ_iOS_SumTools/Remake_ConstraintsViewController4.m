//
//  Remake_ConstraintsViewController4.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Remake_ConstraintsViewController4.h"

@interface Remake_ConstraintsViewController4 ()
@property (nonatomic, strong) UIButton *movingButton;
@property (nonatomic, assign) BOOL topLeft;

@end

@implementation Remake_ConstraintsViewController4

-(void)loadView
{
    [super loadView];
    _movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:_movingButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [_movingButton setTitle:@"点击" forState:UIControlStateNormal];
    _movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    _movingButton.layer.borderWidth = 3;
    
    [_movingButton addTarget:self action:@selector(clickWithButton:) forControlEvents:UIControlEventTouchUpInside];
    self.topLeft = YES;
    [self.view setNeedsUpdateConstraints];
    
    // Do any additional setup after loading the view.
}

+ (BOOL)requiresConstraintBasedLayout
{
    
    return YES;
}


- (void)updateViewConstraints {
    
    //  重置约束 会把已有的约束删除重新添加
    [self.movingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        
        if (self.topLeft) {
            make.left.equalTo(self.view).offset(10);
            make.top.equalTo(self.view).offset(10);
        }
        else {
            make.bottom.equalTo(self.view).offset(-10);
            make.right.equalTo(self.view).offset(-10);
        }
    }];
    [super updateViewConstraints];
}
- (void)clickWithButton:(UIButton *)button
{
    self.topLeft = !self.topLeft;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded];
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
