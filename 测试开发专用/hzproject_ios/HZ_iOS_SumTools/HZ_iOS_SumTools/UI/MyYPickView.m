//
//  MyYPickView.m
//  HZ_Haiergc
//
//  Created by jason on 16/7/20.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "MyYPickView.h"
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/)   [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

@implementation MyYPickView
- (id)initWithDataArr:(NSArray *)arr{
    if (self = [super init]) {
        
        
        self.frame=[UIScreen mainScreen].bounds;
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
        _dataSourceArr =arr;
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    
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
    UIButton *sureBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-50, 0, 50, 44)];
    [sureBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setTitle:@"确定  " forState:UIControlStateNormal];
    [sureBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [sureBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [topView addSubview:sureBtn];
    
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(upLoadImage:)];
    
    [view addGestureRecognizer:tap];
    
    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,ScreenHeight-216,ScreenWidth, 216)];
    _pickView.backgroundColor = [UIColor whiteColor];
    _pickView.dataSource =self;
    _pickView.delegate =self;
    
    [self addSubview:_pickView];
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
//    return 20;
//}
-(void)upLoadImage:(UITapGestureRecognizer *)tap{
    
    [self removeFromSuperview];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dataSourceArr count];
}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dataSourceArr objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _MyRow = row;
    
    
}

- (void)cancelBtnAction:(UIButton *)btn{
    [self removeFromSuperview];
}
- (void)btnClick:(UIButton *)btn{
    [self removeFromSuperview];
    if (_dataSourceArr.count >0) {
        _result(_dataSourceArr[_MyRow],_MyRow);
    }
    
}
@end
