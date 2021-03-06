//
//  NewMethods.h
//  HZ_Dailyqd
//
//  Created by apple on 15/1/10.
//  Copyright (c) 2015年 HuaZhengInfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewMethods : NSObject
/*字符串,文件管理*/
//字典转双引号jsonStr
+(NSString *)transformJsonString:(NSDictionary *)dic;

//json转字典
+(NSDictionary *)transformDictionary:(NSString  *)str;

/*
 写沙盒缓存
 */
+ (void)writeToFileOfContent:(id)object withfileName:(NSString *)fileName;
/*
 读沙盒缓存
 */
+ (id)readFileWithfileName:(NSString *)fileName;

/*
NSUserdefault缓存
 */
+ (void)writeToNSUserdefaultWithKeys:(NSArray *)arr andValus:(NSArray *)valus;

/*
清除 NSUserdefault缓存
 */
+ (void)removeNSUserdefaultWithKeys:(NSArray *)arr;

/*
 数据库 插入数据
 */
+ (void)insertSql:(id)object;

/*
 数据库 读取数据
 */
+ (NSString*)readSql;

/*
数据库 删除数据
*/
+ (void)deleteSql;

/*
 数据库 修改数据
 */
+ (void)updataSql:(id)object;
@end
