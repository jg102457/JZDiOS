//
//  AgencyModel.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AgencyModel.h"
#import "MJExtension.h"
@implementation AgencyModel
//+ (AgencyModel *)shareAgencyModel{
//    static AgencyModel *agency = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        agency = [[AgencyModel alloc]init];
//    });
//
//    return agency;
//}
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//
//
//}
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"DealerID":@"ID"};
}
@end


