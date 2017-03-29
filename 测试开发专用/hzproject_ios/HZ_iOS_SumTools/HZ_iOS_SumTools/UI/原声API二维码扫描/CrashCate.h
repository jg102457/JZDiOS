//
//  CrashCate.h
//  Big_WHEEL
//
//  Created by jason on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashCate : NSObject
void uncaughtExceptionHandler(NSException *exception);
@end
