//
//  LanchViewController.h
//  Big_WHEEL
//
//  Created by jason on 16/7/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "RootViewController.h"

@interface LanchViewController : UIViewController
@property (nonatomic,strong)UIPageControl *pageControl; //指示当前处于第几个引导页
@property (nonatomic,strong) UIButton *btn;
//@property (nonatomic,copy) void(^putInBtnClick)(NSString *);
+(instancetype)creatLanchViewWithImageArr:(NSArray *)imageArr;

@end
