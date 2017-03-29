//
//  SubBezierPath.h
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubBezierPath : UIBezierPath
//画笔的颜色
@property (nonatomic,copy) UIColor *lineColor;
//是否是橡皮擦
@property (nonatomic,assign) BOOL isErase;
@end
