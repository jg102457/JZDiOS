//
//  MBProgressHUD+CommenHUD.m
//  ConciergeCar
//
//  Created by ZhangZiyao on 15/5/15.
//  Copyright (c) 2015年 烟台易云网络科技有限公司. All rights reserved.
//

#import "MBProgressHUD+CommenHUD.h"

@implementation MBProgressHUD (CommenHUD)

+(instancetype)showHUDAddedTo:(UIView *)view Text:(NSString *)text{
    
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    //如果之前视图有内容，先隐藏
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = text;
    [hud show:YES];
    [view addSubview:hud];
    return hud;
}
+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text afterDelay:(NSTimeInterval)timeInterval{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    
    hud.labelText = text;
    [hud show:YES];
    [hud hide:YES afterDelay:timeInterval];
    [view addSubview:hud];
    return hud;
}
+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text{
    
    return [self showAutoHideHUDAddedTo:view Text:text afterDelay:3];
}

@end
