//
//  AgencyMethod.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AgencyMethod.h"

@implementation AgencyMethod
/*根据经销商等级  返回等级名字*/
+ (void)returnNameAccordingTo:(NSString *)ParaID Success:(void (^) (id strig))success{

    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"PID":@"14"};
    __block NSString *ParaNameStr;
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/Parameter/GetParameterList" andInputKeys:dic Success:^(id dataArr) {
            if ([dataArr[@"returnCode"] integerValue]==1) {
                //正常数据
 
                for (NSDictionary *ParaName in dataArr[@"data"]) {
                    
                    if ([ParaName[@"ParaID"] isEqualToString:ParaID]) {
                        ParaNameStr = ParaName[@"ParaName"];
                    }
                }
            }else{
            
                ParaNameStr =@"";
            }
   
            success(ParaNameStr);

        } failure:^(id error) {
            
            ParaNameStr= @"123";
            success(ParaNameStr);
   
        }];
    
//        
//    });
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);


}
@end
