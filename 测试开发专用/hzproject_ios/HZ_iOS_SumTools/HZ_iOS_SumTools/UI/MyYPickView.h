//
//  MyYPickView.h
//  HZ_Haiergc
//
//  Created by jason on 16/7/20.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyYPickView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) NSArray *dataSourceArr;
@property (nonatomic,strong) UIPickerView *pickView;
@property (nonatomic,assign) NSInteger MyRow;
@property (nonatomic, copy) void(^result)(NSString * didselect ,NSInteger didSelectRow);
- (id)initWithDataArr:(NSArray *)arr;
- (void)creatUI;
@end
