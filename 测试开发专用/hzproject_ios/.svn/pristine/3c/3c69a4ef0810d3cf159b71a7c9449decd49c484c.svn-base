//
//  DatePickView.m
//  MobileOffice
//
//  Created by jason on 16/7/20.
//  Copyright © 2016年 ShangchaoGao. All rights reserved.
//

#import "DatePickView.h"
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/)   [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

@implementation DatePickView{
    NSDate *date;
    NSString *dateStr;
}
- (id)initWithFrame:(CGRect)frame andIfGetLastMonth:(BOOL )isLast{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
        [self creatUI:isLast];
    }
    
    return self;
}
- (void)creatUI:(BOOL)isLast{
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-216-44)];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-216-44, ScreenWidth, 44)];
    [topView setBackgroundColor:RGBA(236, 236, 236, 1)];
    [self addSubview:topView];
    UIButton *cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [cancelBtn setTitle:@"  取消" forState:UIControlStateNormal];
    [topView addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(cancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    UIButton *sureBtn=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-50, 0, 50, 44)];
    [sureBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setTitle:@"确定  " forState:UIControlStateNormal];
    [sureBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [sureBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [topView addSubview:sureBtn];
    
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(upLoadImage:)];
    
    [view addGestureRecognizer:tap];
    
    _pickView= [[UIDatePicker alloc]init];
    _pickView.frame=CGRectMake(0,ScreenHeight-216,ScreenWidth, 216);

    //设置为中文
    
    [_pickView setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    //设置显示日期
    
  
    NSDateFormatter *myformater = [[NSDateFormatter alloc]init];
     [myformater setDateFormat:@"YYYY年MM月dd日"];
    NSDate *nowDate = [NSDate date];
    NSDate * LastDate = [UIUtils getLastMonth];
    if (isLast) {
        
       [_pickView setDate:LastDate animated:YES];
        
        
        date = LastDate;
        
    }else{
      [_pickView setDate:nowDate animated:YES];

        date = nowDate;
    }
    NSLog(@"&&&&&&&&&&&%@",dateStr);
    _pickView.maximumDate = nowDate;
    _pickView.datePickerMode=UIDatePickerModeDate;
    [self addSubview:_pickView];
    [_pickView addTarget:self action:@selector(selectedChanged:) forControlEvents:UIControlEventValueChanged];

}
- (void)selectedChanged:(UIDatePicker *)datePicker{
    date = datePicker.date;
    

}
-(void)upLoadImage:(UITapGestureRecognizer *)tap{
    
    [self removeFromSuperview];
}
- (void)cancelBtnAction:(UIButton *)btn{
    [self removeFromSuperview];
}
- (void)btnClick:(UIButton *)btn{
    [self removeFromSuperview];
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"YYYY年MM月dd日"];
    dateStr = [formater stringFromDate:date];
    NSLog(@"++++++%@",dateStr);
    _result(dateStr);
}
@end
