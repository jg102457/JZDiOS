//
//  AllModel.h
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllModel : NSObject
@property (strong, nonatomic) NSMutableArray *statuses;
/** 存放着一堆的广告数据（里面都是Ad模型） */
@property (strong, nonatomic) NSArray *ads;

@end
