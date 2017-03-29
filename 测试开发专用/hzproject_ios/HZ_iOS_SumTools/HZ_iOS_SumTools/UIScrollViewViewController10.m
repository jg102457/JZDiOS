//
//  UIScrollViewViewController10.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIScrollViewViewController10.h"

@interface UIScrollViewViewController10 ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView       *contentView;

@end

@implementation UIScrollViewViewController10

-(void)loadView
{
    [super loadView];
    _scrollView = [[UIScrollView alloc]init];
    _contentView = [[UIView alloc]init];
    [self.view addSubview:_scrollView];
    [self.scrollView addSubview:_contentView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"09_UIScrollView";
    _scrollView.backgroundColor = [UIColor grayColor];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view); // self.view一样大小
    }];
    _contentView.backgroundColor = [UIColor greenColor];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView); // 大小   = _scrollView
        make.width.equalTo(_scrollView); // width  = _scrollView
    }];
    
    UIView *lastView;
    CGFloat height = 25;
    
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [self randomColor];
        [_contentView addSubview:view];
        // 点击 改变透明度
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [view addGestureRecognizer:singleTap];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.mas_bottom : @0); // 第一个View top = 0;
            make.left.equalTo(@0); // left 0
            make.width.equalTo(_contentView); // width = _contentView;
            make.height.equalTo(@(height)); // heinght = height
        }];
        
        height += 25; // += 25;
        lastView = view;
    }
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView); // bottom =  lastView
    }];
    
    // Do any additional setup after loading the view.
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)singleTap:(UITapGestureRecognizer*)sender {
    [sender.view setAlpha:sender.view.alpha / 1.20]; // To see something happen on screen when you tap :O
    [self.scrollView scrollRectToVisible:sender.view.frame animated:YES];
};

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
