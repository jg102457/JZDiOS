//
//  MJEXViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MJEXViewController.h"
#import "AllModel.h"
#import "MJExtension.h"
#import "MJUsr.h"
@interface MJEXViewController ()

@end

@implementation MJEXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"name" : @"今天天气真不错！",
                                       @"sex" : @"123"
                                       },
                                   
                                   @{
                                       @"name" : @"今天天气真不错！",
                                       @"sex" : @"123"
                                       }
                                   
                                   ],
                           @"ads" :@[
                                   @{
                                       @"height" : @"ad01.png",
                                       @"year" : @"http://www.ad01.com"
                                       }, 
                                   
                                   @{                               
                                       @"height" : @"ad02.png",
                                       @"year" : @"http://www.ad02.com"
                                       }                       
                                   ],                       
                           
                           };
    AllModel *model = [AllModel mj_objectWithKeyValues:dict];
    MJUsr *mod =model.ads[0];
    
    NSLog(@"________%@",mod.year);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
