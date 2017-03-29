//
//  AgencyDetialViewController.h
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "RootViewController.h"
#import "AgencyModel.h"
@interface AgencyDetialViewController : RootViewController
@property (nonatomic,assign) BOOL isAdd;
@property (nonatomic,strong) AgencyModel *agencyModel;
@end
