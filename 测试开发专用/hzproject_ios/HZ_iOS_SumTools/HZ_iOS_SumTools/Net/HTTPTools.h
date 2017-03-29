//
//  HTTPTools.h
//  HZ_Haiergc
//
//  Created by hou on 16/4/11.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@class HTTPTools;
typedef enum {

    ProgressTpyeIndeterminate,
    /** 用饼图显示进度 */
    ProgressTpyeDeterminate,
    /** 进度条 */
    ProgressTpyeDeterminateHorizontalBar,
    /** 圆环 */
    ProgressTpyeAnnularDeterminate,
    /** 自定义视图 */
    ProgressTpyeCustomView,
    /** 只显示文字 */
    ProgressTpyeText
    
}ProgressTpye;
@interface HTTPTools : NSObject
@property (assign,nonatomic) ProgressTpye * progressType;
#pragma mark- postConnectionHTTP
/*旧版方法*/
//+ (void)PostAFHttpWithURL:(NSString *)URL andIntPutKeys:(NSDictionary *)dic Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure;
////带菊花样式
//+ (void)PostAFHttpWithURL:(NSString *)URL andIntPutKeys:(NSDictionary *)dic andAddHudTo:(UIView *)view Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure;
//#pragma mark-GetHTTP
//+ (void)GetAFHttpWithURL:(NSString *)URL Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure;



#pragma mark- postSessionHTTP
/*ios 9以后只有session 方法  connection将不再使用*/
/*单一的post get请求 *POST GET 均用此方法**/
+ (void)postAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure;
/*带菊花样式的 post get请求*/
+ (void)postAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudTo:(UIView *)view Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure;
/*进度上传数据*/
+ (void)upLoadAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudToView:(UIView *)view andProgressType:(ProgressTpye *)progressType Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure;

/*进度下载数据*/
+ (void)downLoadAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudToView:(UIView *)view andProgressType:(ProgressTpye *)progressType Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure;
/*开启网络监听*/
+ (void)startAFNetworkStatus:(void (^)(NSString * netStatus))netStatus;
//
///*
// webService图片文件上传
// */
//+(void)webUPLoadImagesWithImages:(UIImage *)image andFileName:(NSString *)fileName success:(void(^)(NSArray *dataArray))success fail:(void(^)())fail;
///*
// AF以文件的形式图片上传,也可文件上传.
// */
//+ (void)AFUPLoadImagesWithImages:(UIImage *)image andFileName:(NSString *)fileName success:(void (^)(NSArray *))success fail:(void (^)())fail;
@end
