//
//  DrawLineView.h
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubBezierPath.h"
@interface DrawLineView : UIView
@property (nonatomic,strong) SubBezierPath *beziPath;
@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic,assign) BOOL isErase;
@property (nonatomic,assign) NSInteger lineWidth;
@property (nonatomic,strong) NSMutableArray *beziPathArrM;
@end
