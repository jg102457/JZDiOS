//
//  MyNavigation.m
//  HZ_Haiergc
//
//  Created by jason on 16/5/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "MyNavigation.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface MyNavigation ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;
@end
@implementation UINavigationBar (BackgroundColor)
static char overlayKey;
- (UIView *)overlay
{    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[[UIImage alloc] init]];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        self.overlay.userInteractionEnabled = NO;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}
@end
@implementation MyNavigation
- (void)viewDidLoad{
    [super viewDidLoad];
     self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate =self;
    
    [self creatUI];
    [self systemChanged];
    

   
//
//    [self.navigationBar setTintColor:DefaultColorWhite];


}
- (void)creatUI{
    _backButon = [UIButton buttonWithType:UIButtonTypeSystem];
    _backButon.frame = CGRectMake(0, 0, 40, 40);
    [_backButon setImage:[UIImage imageNamed:@"wihte_bangwencontentDnBackP@2x.png"] forState:UIControlStateNormal];
    [_backButon addTarget:self action:@selector(backBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    //
    _rightButon = [UIButton buttonWithType:UIButtonTypeSystem];
    _rightButon.frame = CGRectMake(0, 0, 24, 24);
    _rightButon.hidden = YES;
    [_rightButon setImage:[UIImage imageNamed:@"更多1.png"] forState:UIControlStateNormal];
    [_rightButon addTarget:self action:@selector(backBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)systemChanged{

    if (_navTitleFont==nil ||_navTitleColor==nil) {
        _navTitleColor = [UIColor whiteColor];
        _navTitleFont = [UIFont systemFontOfSize:19];
    }
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :_navTitleColor, NSFontAttributeName : _navTitleFont }];
    
    if (_navBackColor ==nil) {
        _navBackColor =[UIColor colorWithRed:40/255.0 green:149/255.0 blue:217/255.0 alpha:1];
    }
    [self.navigationBar lt_setBackgroundColor:_navBackColor];
    if (_navBackImage==nil) {
        _navBackImage = [UIImage imageNamed:@"zc@2x"];
    }
//    [self.navigationBar setBackgroundImage:_navBackImage forBarMetrics:UIBarMetricsDefault];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    [self systemChanged];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_backButon];
    viewController.navigationItem.leftBarButtonItem = backItem;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];  
    //
    UIBarButtonItem *backItem2 = [[UIBarButtonItem alloc] initWithCustomView:_rightButon];
    viewController.navigationItem.rightBarButtonItem = backItem2;
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
}
@end


