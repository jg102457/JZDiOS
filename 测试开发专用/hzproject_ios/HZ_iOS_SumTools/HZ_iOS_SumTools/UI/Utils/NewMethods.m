//
//  NewMethods.m
//  HZ_Dailyqd
//
//  Created by apple on 15/1/10.
//  Copyright (c) 2015年 HuaZhengInfo. All rights reserved.
//

#import "NewMethods.h"
#import "FMDatabase.h"
@implementation NewMethods

//
+(NSString *)transformJsonString:(NSDictionary *)dic{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+(NSDictionary *)transformDictionary:(NSString  *)jsonString{

    if (jsonString == nil) {
        
        return nil;
        
        
        
    } 
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        
        return nil;
    }
    
    return dic;

}
+ (void)writeToFileOfContent:(id)object withfileName:(NSString *)fileName{
    NSString *path = [NSString stringWithFormat:@"Documents/%@.txt",fileName];
    NSString  *str = [NSHomeDirectory() stringByAppendingPathComponent:path];
    NSData *data;
    if ([object isKindOfClass:[NSString class]]) {
       data = [object dataUsingEncoding:NSUTF8StringEncoding];
    }else {
        data = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
    }

    [data writeToFile:str atomically:YES];

}
+ (id)readFileWithfileName:(NSString *)fileName{
    NSString *path = [NSString stringWithFormat:@"Documents/%@.txt",fileName];
    NSString  *str = [NSHomeDirectory() stringByAppendingPathComponent:path];
        if ([[NSFileManager defaultManager] fileExistsAtPath:str]) {
        /*默认记住上次第三方登录*/
       
         NSString *receiveStr = [[NSString alloc]initWithContentsOfFile:str encoding:NSUTF8StringEncoding error:nil];

        return receiveStr;
        }
    
    return nil;
}

+ (void)writeToNSUserdefaultWithKeys:(NSArray *)arr andValus:(NSArray *)valus{

    for (int i=0; i<arr.count; i++) {
        [[NSUserDefaults standardUserDefaults] setObject:valus[i] forKey:arr[i]];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    

}
+ (void)removeNSUserdefaultWithKeys:(NSArray *)arr{
    
    for (int i=0; i<arr.count; i++) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:arr[i]];
    }

}

+ (void)insertSql:(id)object{
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];;
    path=[path stringByAppendingPathComponent:@"text.sqlite"];
   FMDatabase  *dataBase=[FMDatabase databaseWithPath:path];
    // 2 打开数据库，如果不存在则创建并且打开
    BOOL open=[dataBase open];
    if(open){
        NSLog(@"数据库打开成功");
        BOOL result=[dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS t_text (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL);"];
                 if (result) {
                         NSLog(@"创表成功");
                     }else{
                         NSLog(@"创表失败");
                       }
     
    }

    //3 创建表
    

    //所有的数据均转换成json格式
    //4 插入数据
   // NSString * insertSql=@"insert into t_user(id,name) values(?,?)";

    NSString *jsonStr;
    if ([object isKindOfClass:[NSString class]]) {
      //字符串直接插入
        jsonStr = object;
        
    }else{
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
        
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    //    插入语句
    BOOL inflag3 = [dataBase executeUpdate:@"INSERT INTO t_text (name) VALUES (?);", jsonStr];
    if (inflag3) {
        NSLog(@"插入数据成功");
    }else{
        NSLog(@"插入数据失败");
    }
    [dataBase close];
}
+ (NSString *)readSql{
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingPathComponent:@"text.sqlite"];
    
    FMDatabase  *dataBase=[FMDatabase databaseWithPath:path];
    // 2 打开数据库，如果不存在则创建并且打开
    BOOL open=[dataBase open];
    if(open){
        NSLog(@"数据库打开成功");
    }
    NSString * sql=@"select * from t_text";
    FMResultSet *result=[dataBase executeQuery:sql];
    while(result.next){
        
        NSString * name=[result stringForColumn:@"name"];
        NSLog(@"%@",name);
        return name;
    }
    return nil;
}
+ (void)deleteSql
{
        //    [self.db executeUpdate:@"DELETE FROM t_student;"];
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingPathComponent:@"text.sqlite"];
    
    FMDatabase  *dataBase=[FMDatabase databaseWithPath:path];
    // 2 打开数据库，如果不存在则创建并且打开
    BOOL open=[dataBase open];
    if(open){
        NSLog(@"数据库打开成功");
        [dataBase executeUpdate:@"DROP TABLE IF EXISTS t_text;"];
        [dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS t_text (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL);"];
    }
    [dataBase close];
    
}

+ (void)updataSql:(id)object{
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingPathComponent:@"text.sqlite"];
    
    FMDatabase  *dataBase=[FMDatabase databaseWithPath:path];
    // 2 打开数据库，如果不存在则创建并且打开
    BOOL open=[dataBase open];
    if(open){
    NSString *update=@" update t_text set name=? WHERE id = 3";
    BOOL flag=  [dataBase executeUpdate:update,object];
    if(flag){
        NSLog(@"修改成功");
    }
    }
    [dataBase close];
}
@end
