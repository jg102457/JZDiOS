//
//  xialaTableView.m
//  tableviewControll
//
//  Created by LJ on 16/3/16.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "xialaTableView.h"

@implementation xialaTableView


- (instancetype)initWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    if (self = [super init]) {
        
        self.contentArray = [NSArray arrayWithArray:dataArray];
        self.modelArr = modelArr;
        CGFloat width = 156;
        CGFloat x = Cusframe.origin.x-30;
        CGFloat y = Cusframe.origin.y+10;
        CGFloat height = 220;
        if (x<0) {
            x = ScreenWidth/2-80;
        }
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sss = (UIScrollView *)view;
      
            if (y+220>sss.contentSize.height) {
                y =sss.contentSize.height-230;
            }
        }
        
        self.frame = CGRectMake(x, y, width, height);
        self.tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.tableView.tag = 888;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.layer.borderWidth=1;
        self.tableView.layer.borderColor=[UIColor blackColor].CGColor;
        self.tableView.layer.masksToBounds=YES;
        
        [self addSubview:self.tableView];
        [view addSubview:self];
        [self.tableView reloadData];
    }
    return self;
}

- (instancetype)initZDScreenWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    if (self = [super init]) {
        
        self.contentArray = [NSArray arrayWithArray:dataArray];
        self.modelArr = modelArr;
        CGFloat width = 156;
        CGFloat x = Cusframe.origin.x-30;
        CGFloat y = Cusframe.origin.y;
        CGFloat height = 180;
        if (x<0) {
            x = ScreenWidth/2-80;
        }
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sss = (UIScrollView *)view;
            
            if (y+220>sss.contentSize.height) {
                y =sss.contentSize.height-230;
            }
        }
        
        self.frame = CGRectMake(x, y, width, height);
        self.tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.tableView.tag = 888;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.layer.borderWidth=1;
        self.tableView.layer.borderColor=[UIColor blackColor].CGColor;
        self.tableView.layer.masksToBounds=YES;
        
        [self addSubview:self.tableView];
        [view addSubview:self];
        [self.tableView reloadData];
    }
    return self;
}


//修改详情 重写init
- (instancetype)initWithPinPaiFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    if (self = [super init]) {
        self.contentArray = [NSArray arrayWithArray:dataArray];
        self.modelArr = modelArr;
        CGFloat width = 130;
        CGFloat x = Cusframe.origin.x-60;
        CGFloat y = Cusframe.origin.y-5;
        CGFloat height = 220;
        if (x<0) {
            x = ScreenWidth/2-80;
        }
//        if (y+220>ScreenHeight) {
//            y =y+220-(y+220-ScreenHeight);
//        }
        self.frame = CGRectMake(x, y, width, height);
        self.tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.tableView.tag = 888;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:self.tableView];
        [view addSubview:self];
        [self.tableView reloadData];
    }
    return self;
}
//省市区 重写init
- (instancetype)initWithNewFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    if (self = [super init]) {
        self.contentArray = [NSArray arrayWithArray:dataArray];
        self.modelArr = modelArr;
        CGFloat width = 130;
        CGFloat x = Cusframe.origin.x-19;
        CGFloat y = Cusframe.origin.y-80;
        CGFloat height = 160;
        //        if (x<0) {
        //            x = ScreenWidth/2-80;
        //        }
        //        if (y+220>ScreenHeight) {
        //            y = ScreenHeight/2-110;
        //        }
        self.frame = CGRectMake(x, y, width, height);
        self.tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.tableView.tag = 888;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.layer.borderWidth=1;
        self.tableView.layer.borderColor=[UIColor blackColor].CGColor;
        self.tableView.layer.masksToBounds=YES;

        [self addSubview:self.tableView];
        [view addSubview:self];
        [self.tableView reloadData];
    }
    return self;
}

+ (instancetype)creatNewViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view{
   return [[xialaTableView alloc] initWithNewFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view];


}

//+ (instancetype)creatUsGrpViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view{
//
//
//}

//省市区联动的frame
+ (instancetype)creatViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    
    return [[xialaTableView alloc] initWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view];
}
+ (instancetype)ZDScreencreatViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view{
    return [[xialaTableView alloc] initZDScreenWithFrame:Cusframe contentData:dataArray modelArr:modelArr OnView:view];

}
//修改详情品牌的frame
+ (instancetype)creatPinPaiViewWithFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view
{
    
    return [[xialaTableView alloc] initWithPinPaiFrame:(CGRect)Cusframe contentData:(NSArray *)dataArray modelArr:(NSArray *)modelArr OnView:(UIView *)view];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Display"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Display"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = self.contentArray[indexPath.row];
    
//    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-2, cell.frame.size.width, 1)];
//    line.backgroundColor = [UIColor blackColor];
//    [cell addSubview:line];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentArray.count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.result) {
        self.result(self.contentArray[indexPath.row],self.modelArr,indexPath.row);
    }
    
    [self removeFromSuperview];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row % 2 == 0) {
//        cell.backgroundColor = bg_nav_color;
//        cell.textLabel.textColor = [UIColor whiteColor];
//        cell.textLabel.numberOfLines = 0;
//    } else {
//        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.numberOfLines = 0;
//    }
}


@end

