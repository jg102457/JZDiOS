//
//  AgencyMethod.h
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AgencyMethod : NSObject
+ (void)returnNameAccordingTo:(NSString *)ParaID Success:(void (^) (id string))success;
@end
