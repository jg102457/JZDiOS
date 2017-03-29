//
//  DatePickView.h
//  MobileOffice
//
//  Created by jason on 16/7/20.
//  Copyright © 2016年 ShangchaoGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickView : UIView
@property (nonatomic,strong) NSArray *dataSourceArr;
@property (nonatomic,strong) UIDatePicker *pickView;
@property (nonatomic,assign) NSInteger MyRow;
@property (nonatomic, copy) void(^result)(NSString * didselect);
- (id)initWithFrame:(CGRect)frame andIfGetLastMonth:(BOOL )isLast;
@end
