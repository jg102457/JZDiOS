//
//  Composite_EdgesViewController6.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Composite_EdgesViewController6.h"

@interface Composite_EdgesViewController6 ()

@end

@implementation Composite_EdgesViewController6

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIView *lastView = self.view;
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));//相对于上一个View 5 10 -15 -20
        }];
        lastView = view;
    }
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
