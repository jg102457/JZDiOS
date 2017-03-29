//
//  MyTabBar.h
//  Big_WHEEL
//
//  Created by jason on 16/6/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBar : UITabBarController
@property (nonatomic,strong)UIImageView *tabImgView;
- (void)createBottomTabBarView:(NSArray *)nameArr andNormarlImageArr:(NSArray *)imageNormalArr andSelectImageArr:(NSArray *)imagePressArr;
- (void)addViewControllerArray:(NSArray *)viewControllerArr;
@end
