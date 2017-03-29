//
//  ContrastViewController.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ContrastViewController.h"

@interface ContrastViewController ()
@property (nonatomic,strong) UIView *myView;
@end

@implementation ContrastViewController

-(void)loadView
{
    [super loadView];
    _myView = [[UIView alloc]init];
    [self.view addSubview:_myView];
    
    
    _myView.backgroundColor = [UIColor orangeColor];
    _myView.translatesAutoresizingMaskIntoConstraints = NO;
    
//    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:_myView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10], [NSLayoutConstraint constraintWithItem:_myView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10], [NSLayoutConstraint constraintWithItem:_myView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10], [NSLayoutConstraint constraintWithItem:_myView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10],]];

    //VLF
    //nslayout
    //sdlaout
    //masnory
    
     [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(self.view).offset(10);     //  相对于self.view 顶部 10
     make.left.equalTo(self.view).offset(10);    //  相对于self.view 左边 10
     make.bottom.equalTo(self.view).offset(-10); //  相对于self.view 底部 -10
     make.right.equalTo(self.view).offset(-10);  //  相对于self.view 右边 -10

     }];
     
    
    
    
    /*
     
     UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
     [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.edges.equalTo(self.view).insets(padding);
     }];
     */
    
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
