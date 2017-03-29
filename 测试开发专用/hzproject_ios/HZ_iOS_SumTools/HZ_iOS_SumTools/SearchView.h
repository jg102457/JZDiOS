//
//  SearchView.h
//  HZ_iOS_SumTools
//
//  Created by jason on 17/1/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,copy) void (^btnClickBlock)(UIButton *);
@end
