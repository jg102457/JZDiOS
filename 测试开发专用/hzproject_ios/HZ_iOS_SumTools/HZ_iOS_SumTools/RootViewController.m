//
//  RootViewController.m
//  Big_WHEEL
//
//  Created by jason on 16/6/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "HZAnimation.h"
#import <UIKit/UIKit.h>
@interface RootViewController ()<UIViewControllerAnimatedTransitioning>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = @"cube";
//    transition.subtype = kCATransitionFromRight;
//    transition.delegate = self;
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *arr;
   
    // class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
    AFNetworkReachabilityManager *mang = [AFNetworkReachabilityManager  sharedManager];
    [mang setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"自带网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                [self showTextOnly:@"网络断开连接"];
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
    }];
    [mang startMonitoring];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.8;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    [HZAnimation opacityAnimation:1 toView:self.view];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)showTextOnly:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.margin = 30.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}
- (BOOL)shouldAutorotate
{
    
    
    return YES;
}
//支持的方向(开启了以后只支持当前一个屏幕方向)
- (NSUInteger)supportedInterfaceOrientations {
    NSLog(@"JJJJJJJJJJJJ%@",self.navigationController.topViewController);
    return   UIInterfaceOrientationPortraitUpsideDown;
    
}
@end
