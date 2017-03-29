//
//  SearchView.m
//  HZ_iOS_SumTools
//
//  Created by jason on 17/1/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView{

    UIImageView * searchImge;
    UILabel *searchLabel;
}
-(id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    backView.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    [self addSubview:backView];
    
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(20,5,ScreenWidth-40,self.frame.size.height-10)];
    _searchTextField.layer.cornerRadius = 3;
    _searchTextField.backgroundColor =[UIColor whiteColor];
    _searchTextField.returnKeyType = UIReturnKeySearch;
    _searchTextField.delegate =self;
    [_searchTextField becomeFirstResponder];
//    [_searchTextField addDoneOnKeyboardWithTarget:self action:@selector()];
    [_searchTextField resignFirstResponder];
    [backView  addSubview:_searchTextField];
    
    
     searchImge =[[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-22)/2-22,(self.frame.size.height-22)/2 , 22, 22)];
    searchImge.image=[UIImage imageNamed:@"搜索2.png"];
    [backView addSubview:searchImge];
    
    searchLabel =[Tools initWithNormalFrame:CGRectMake((ScreenWidth-22)/2, (self.frame.size.height-22)/2, 50, 22)  LabelwithText:@"搜索" andfont:[UIFont systemFontOfSize:15]];
    [backView addSubview:searchLabel];


}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    searchImge.hidden=YES;
    searchLabel.hidden =YES;

}
@end
