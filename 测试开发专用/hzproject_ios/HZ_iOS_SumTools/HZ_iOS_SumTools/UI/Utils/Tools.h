//
//  Tools.h
//  demo
//
//  Created by jason on 16/5/24.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextView.h"
#import "NewMethods.h"
@interface Tools : UIViewController
//自定义 快速 生成自适应/普通Label
+ (UILabel *)initWithFrame:(CGRect)frame LabelwithText:(NSString *)text andfont:(UIFont *)font;
+ (UILabel *)initWithNormalFrame:(CGRect)frame LabelwithText:(NSString *)text andfont:(UIFont *)font;
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font;
//自定义快速生成 自适应的button/普通button
+ (UIButton *)initWithFrame:(CGRect)frame ButtonWithText:(NSString *)text andfont:(UIFont *)font;
+ (UIButton *)initWithNormalFrame:(CGRect)frame ButtonWithText:(NSString *)text andfont:(UIFont *)font andImage:(UIImage *)image1 andSelectImage:(UIImage *)image2;
//自定义快速生成 自适应高度的,带等待文字的textView
+ (MyTextView *)intWithFrame:(CGRect)frame PlaceHoder:(NSString *)text andfont:(UIFont *)font;
//快速生成系统警告提示框
/*样式1*/
+(void)Addtarget:(UIViewController *)controler select:(SEL)Selcet andTitle:(NSString *)title;
/*样式2--带文本框*/
+(void)Addtarget:(UIViewController *)controler select:(SEL)Selcet andTitle:(NSString *)title withTextFieldtext:(void(^)(NSString *text))text;
/*样式3--多个文本框--*/
+(void)Addtarget:(UIViewController *)controler  andTitle:(NSString *)title withTextFieldtext:(void(^)(NSMutableArray *textArr))textArr andTextFiledNum:(NSString *)num andPlaceHold:(NSArray *)palceArr;
/*多图选择*/
+ (void)photoPushFromView:(UIViewController *)view;

@end
