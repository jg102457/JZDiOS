//
//  AgencyModel.h
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AgencyModel : NSObject
@property (nonatomic,copy) NSString *DealerName;
@property (nonatomic,copy) NSString *DealerID;
@property (nonatomic,copy) NSString *CompanyName;
@property (nonatomic,copy) NSString *Address;
@property (nonatomic,copy) NSString *Phone;
@property (nonatomic,copy) NSString *QQ;
@property (nonatomic,copy) NSString *WeChat;
@property (nonatomic,copy) NSString *Email;
@property (nonatomic,copy) NSString *Level;
@property (nonatomic,copy) NSString *RegionalHeadUserID;
//额外增加的经销商等级名字字段
@property (nonatomic,copy) NSString *ParaName;
@end
