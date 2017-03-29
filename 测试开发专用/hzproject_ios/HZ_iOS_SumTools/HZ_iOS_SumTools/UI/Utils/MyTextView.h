//
//  MyTextView.h
//  demo
//
//  Created by jason on 16/5/24.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextView : UITextView
@property (nonatomic,strong) UILabel * placeTextLab;
@property (nonatomic,strong) NSString *placeHolder;
@property (nonatomic,strong) UIColor *placeColor;
@property (nonatomic,assign) BOOL Textnil;
@property (nonatomic,assign) CGFloat textHeight;
-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText;
@end
