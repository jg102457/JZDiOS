//
//  HTTPTools.m
//  HZ_Haiergc
//
//  Created by hou on 16/4/11.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HTTPTools.h"

@implementation HTTPTools

//+ (void)PostAFHttpWithURL:(NSString *)URL andIntPutKeys:(NSDictionary *)dic Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure{
//    
//    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manger POST:URL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //沦为夏天的电影只能重播观众
//        if ([operation.responseString  isEqualToString:@"1"]||[operation.responseString  isEqualToString:@"0"]) {
//            success(operation.responseString);
//        }else{
//            success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//       
//        failure(error);
//    }];
//
//}
////带菊花样式
//+ (void)PostAFHttpWithURL:(NSString *)URL andIntPutKeys:(NSDictionary *)dic andAddHudTo:(UIView *)view Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.removeFromSuperViewOnHide = YES;
//    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manger POST:URL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //沦为夏天的电影只能重播
//        [hud hide:YES];
//        if ([operation.responseString  isEqualToString:@"1"]||[operation.responseString  isEqualToString:@"0"]) {
//            success(operation.responseString);
//        }else{
//            success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [hud hide:YES];
//
//        
//    }];
//    
//}
//+ (void)GetAFHttpWithURL:(NSString *)URL Success:(void(^)(id dataArr))success failure:(void(^)(id error))failure{
//
//    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manger GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        failure(error);
//    }];
//
//
//
//}
/*POST GET 均用此方法*/
+ (void)postAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = 12;
    //使用默认的接受类型,如果不在默认的范围内 放开如下方法,单独设置
//   manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger POST:URL parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //沦为夏天的电影只能重播观众

            success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
           failure(error);
    }];


}
+ (void)postAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudTo:(UIView *)view Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure{

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval =12;
    //使用默认的接受类型,如果不在默认的范围内 放开如下方法,单独设置
    //   manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger POST:URL parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        [hud hide:YES];
        //沦为夏天的电影只能重播观众
        
        success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [hud hide:YES];
        failure(error);
    }];

}
+ (void)upLoadAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudToView:(UIView *)view andProgressType:(ProgressTpye *)progressType Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = progressType;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //2.上传文件
   
    

    [manager POST:URL parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /*data形式*/
//        //上传文件参数
//        UIImage *iamge = [UIImage imageNamed:@"123.png"];
//        NSData *data = UIImagePNGRepresentation(iamge);
//        //这个就是参数
//        [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        
        /*URL形式*/
           [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        CGFloat prog = 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        hud.progress = prog;

        //打印下上传进度

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        hud.hidden = YES;
        //请求成功
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hud.hidden = YES;
        //请求失败
        failure(error);
    }];


}
+ (void)downLoadAFHttPSessionWithURL:(NSString *)URL andInputKeys:(NSDictionary *)dic andAddHudToView:(UIView *)view andProgressType:(ProgressTpye *)progressType Success:(void (^) (id dataArr))success failure:(void (^)(id error))failure{
//
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = progressType;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *url = [NSURL URLWithString:URL];
    
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        CGFloat prog = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        hud.progress = prog;
//        NSLog(@"-------%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载地址
        NSLog(@"默认下载地址:%@",targetPath);
        
        //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL URLWithString:filePath];
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        hud.hidden = YES;
        if (![error isEqual:[NSNull null]]) {
            failure(error);
        }else{
        
      //回到缓存地址
            success(filePath);
        }
      
        
    }];
    
    //开始启动任务
    [task resume];
}
+ (void)startAFNetworkStatus:(void (^)(NSString * netStatus))netStatus{
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                netStatus(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                netStatus(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                netStatus(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                netStatus(@"WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;
    [manager startMonitoring];
}


+(void)webUPLoadImagesWithImages:(UIImage *)image andFileName:(NSString *)fileName success:(void(^)(NSArray *dataArray))success fail:(void(^)())fail{
        UIImage *aaa = [self scaleFromImage:image toSize:CGSizeMake(1000, 1000)];
        NSData *imagedddd = UIImageJPEGRepresentation(aaa,0.001);
        NSString *pictureDataString=[imagedddd base64Encoding];
    HZHttpRequest *request = [[HZHttpRequest  alloc]init];
    //调用webservice 接口
//  [request requestWithJSONString:(NSDictionary *) URLClass:<#(NSString *)#> Method:<#(NSString *)#> HUDAddToView:<#(UIView *)#> HUDLabelText:<#(NSString *)#> FinishCallbackBlock:<#^(NSString *resultStr)block#>]
    
}
//+ (void)AFUPLoadImagesWithImages:(UIImage *)image andFileName:(NSString *)fileName success:(void (^)(NSArray *))success fail:(void (^)())fail{
////接口的 的key 
//    NSDictionary *parameters = @{@"uid": @"EFGH"};//对应上面接口非图片的参数 file是图片的key
//    
//    //创建请求
//    
//  AFHTTPRequestOperationManager  *manager = [AFHTTPRequestOperationManager manager];
//    
//    //设置请求的解析器为AFHTTPResponseSerializer（用于直接解析数据NSData），默认为AFJSONResponseSerializer（用于解析JSON）
//    
//       manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    //发送POST请求，添加需要发送的文件，此处为图片
//    
//    [manager POST:@"接口地址" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        //添加图片，并对其进行压缩（0.0为最大压缩率，1.0为最小压缩率）
//        
//        //        UIImagePNGRepresentation(<#UIImage *image#>)
//        
//        NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
//        
//        //添加要上传的文件，此处为图片,如果是多图就for循环添加
//        
//        [formData appendPartWithFileData:imageData name:@"file(看上面接口，服务器放图片的参数名Key）" fileName:@"图片名字(随便写一个，（注意后缀名）如果是UIImagePNGRepresentation写XXXX.png,如果是UIImageJPEGRepresentation写XXXX.jpeg)"mimeType:@"文件类型（此处为图片格式，如image/jpeg，对应前面的PNG/JPEG)"];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        //请求成功（当解析器为AFJSONResponseSerializer时）
//        
//        NSLog(@"Success: %@", responseObject);
//        
//        //请求成功（当解析器为AFHTTPResponseSerializer时）
//        
//        //        NSString *JSONString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        //        NSLog(@"success:%@", JSONString);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        //请求失败
//        
//        NSLog(@"Error: %@", error);
//        
//    }];
//
//
//}
    // 改变图像的尺寸，方便上传服务器
+(UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
    {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
}

@end
