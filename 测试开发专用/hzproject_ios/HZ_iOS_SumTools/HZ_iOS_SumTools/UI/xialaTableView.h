//
//  xialaTableView.h
//  tableviewControll
//
//  Created by LJ on 16/3/16.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xialaTableView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *contentArray;
@property (nonatomic, strong)NSArray *modelArr;

+ (instancetype)creatViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view;
+ (instancetype)ZDScreencreatViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view;


+ (instancetype)creatNewViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view;

//+ (instancetype)creatUsGrpViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view;

//修改详情品牌的frame
+ (instancetype)creatPinPaiViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view;
/*block*/
@property (nonatomic, copy) void(^result)(NSString * didselect ,NSArray *modelArr,NSInteger didSelectRow);


@end
