//
//  MyNavigation.h
//  HZ_Haiergc
//
//  Created by jason on 16/5/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigation : UINavigationController
@property (nonatomic,strong) UIColor *navTitleColor;
@property (nonatomic,strong) UIFont *navTitleFont;
@property (nonatomic,strong) UIImage *navBackImage;

@property (nonatomic,strong) UIColor *navBackColor;
@property (strong,nonatomic)UIButton *backButon;
@property (strong,nonatomic)UIButton *rightButon;
@end
