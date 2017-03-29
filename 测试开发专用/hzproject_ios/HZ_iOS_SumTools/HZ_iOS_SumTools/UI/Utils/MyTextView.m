//
//  MyTextView.m
//  demo
//
//  Created by jason on 16/5/24.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "MyTextView.h"

@implementation MyTextView


-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText{
    self=[super initWithFrame:frame];
    if (self) {
        _textHeight = frame.size.height;
        self.scrollEnabled=YES;
       // self.textContainerInset = UIEdgeInsetsMake(8, 0, 15, 0);//设置页边距
        self.contentInset = UIEdgeInsetsMake(5.f, 0.f, -5.f, 0.f);
        [self addPlaceLabel:placeText];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TextChange:) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    return self;
}
- (void)addPlaceLabel:(NSString *)placeHolder{
    _placeTextLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width, 20)];
    _placeTextLab.textColor = [UIColor lightGrayColor];
    _placeTextLab.font = [UIFont systemFontOfSize:15];
    _placeTextLab.text = placeHolder;
    //xiannxe dAjdsjdbjhuhjjidasbdhsajh
    
    [self addSubview:_placeTextLab];
}
-(void)TextChange:(NSNotification *)notification{
       UITextView *textView = notification.object;
    //设置初始高的时候让文本框的高度不改变
        CGRect frame = textView.frame;
    if (textView.text.length>0) {
        _placeTextLab.hidden = YES;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        
        CGRect textFrame=[[self layoutManager]usedRectForTextContainer:[self textContainer]];
        frame.size.height = textFrame.size.height;
        
    }else {
        
        frame.size.height = self.contentSize.height;
    }
    
    if (frame.size.height>=_textHeight) {
        [UIView animateWithDuration:0 animations:^{
            textView.frame = frame;
        }];
    }
 
}
@end
