//
//  HZHttpRequest.h
//  YinShuiBao
//  封装网络请求方法
//  Created by ShangchaoGao on 14-8-20.
//  Copyright (c) 2014年 ShangchaoGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "UIUtils.h"

@interface HZHttpRequest : NSObject<NSURLConnectionDataDelegate,NSXMLParserDelegate>


@property (retain,nonatomic) NSString* methodStr;
@property (retain,nonatomic) NSMutableArray* keyArr;
@property (retain,nonatomic) NSMutableArray* valueArr;

@property (retain,nonatomic)NSMutableData *resultData;
@property(strong,nonatomic) void (^finishCallbackBlock)(NSString *);
@property (strong,nonatomic)void (^failedBlock)(NSString *);
@property (retain, nonatomic) NSMutableString *backContent;//拼接返回XML解析的json格式字符串
@property (retain, nonatomic) MBProgressHUD *progressHUD;//活动指示视图
@property (retain, nonatomic) UIView *HUDAddToView; //HUD 承载视图
@property (copy, nonatomic) NSString *HUDLabelText; //HUD提示文字
/*dic：请求字典   urlClass：链接地址分类  method：网络请求方法名   toView：HUD 承载视图 text：HUD 提示文字    isCustomerService：是否是客户接口*/

- (void)requestWithJSONString:(NSDictionary *)dic URLClass:(NSString*)urlClass Method:(NSString *)method HUDAddToView:(UIView *)toView HUDLabelText:(NSString *)text  FinishCallbackBlock:(void (^)(NSString *resultStr))block;
@end
