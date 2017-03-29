//
//  MyScrollView.m
//  Big_WHEEL
//
//  Created by jason on 16/7/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "MyScrollView.h"
@implementation MyScrollView{
    CGRect newFrame;
    CGFloat oneWith;
    NSMutableArray *lineWith;

}
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatNomarlUI];
    }
    return self;

}
- (id)initWithFrame:(CGRect)frame andCount:(NSArray *)count{
    if (self = [super initWithFrame:frame ]) {
        newFrame = frame;
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.contentSize = CGSizeMake(ScreenWidth*count.count, frame.size.height);
        [self creatSpecialUI:count];
    }
    return self;
    
}
/*普通滚动视图,布局正常的ScrollView*/
- (instancetype)creatNomarlScrollViewWithFrame:(CGRect)frame{
    return [[MyScrollView alloc]initWithFrame:frame];
}
/*带标题滚动视图,布局的ScollView*/
+ (instancetype)creatSpecialScrollViewWithFrame:(CGRect)frame andCount:(NSArray *)count{
    return [[MyScrollView alloc]initWithFrame:frame andCount:count];
}
- (void)creatNomarlUI{


}
- (void)creatSpecialUI:(NSArray *)count{

        _topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 42)];

    CGFloat textWith = 0.0;
    lineWith = [[NSMutableArray alloc]init];
    for (NSString *str in count) {
       CGSize size =[Tools sizeWithString:str font:[UIFont systemFontOfSize:14]];
        [lineWith  addObject:[NSString stringWithFormat:@"%f",size.width]];
        textWith = textWith + size.width;
    }
    if (textWith<ScreenWidth/2) {
        _topView.contentSize = CGSizeMake(ScreenWidth, 0);
    }else{
       _topView.contentSize = CGSizeMake(2*textWith, 0);
    }
    
    
        _topView.showsHorizontalScrollIndicator = NO;
        _topView.showsVerticalScrollIndicator = NO;
        _topView.backgroundColor = [UIColor whiteColor];
       oneWith = (ScreenWidth-10)/count.count;
       _line = [[UIImageView alloc] initWithFrame:CGRectMake(5+(oneWith-[lineWith[0] floatValue])/2,36 ,[lineWith[0] floatValue], 6)];
        _line.image = [UIImage imageNamed:@"xmhq_jt"];
        _line.tag = 199;
    [_topView addSubview:_line];
        for (int i = 0; i <count.count ; i ++ ) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:count[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            button.selected = NO;
            //设置选中非选中样式
            [button setBackgroundImage:[UIImage imageNamed:@"ydbg_ht"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"rr_jt"] forState:UIControlStateSelected];
            //设置选中非选中字体颜色
            //[button setTitleColor:RGBA(255, 23, 103, 1) forState:UIControlStateSelected];
            [button addTarget:self action:@selector(R1topBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(5+oneWith*i, 0, oneWith, 42);
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.tag = 100 + i;
            if (i == 0 ) {
                button.selected = YES;
                
               // _line.frame =CGRectMake(5+(ScreenWidth-10)/4 - 40,38 , 80, 2);
             //   showIndex = 0;
            }
            [_topView addSubview:button];
        }
        // [topView addSubview:line];
        [self addSubview:_topView];
    [self bringSubviewToFront:_topView];

}
-(void)R1topBtnAction:(UIButton *)button{
    NSInteger tmpIndex = button.tag - 100;
    
    self.contentOffset = CGPointMake(CGRectGetWidth(self.frame)*(CGFloat)tmpIndex, 0);
    
    [self changeTopButtonStatusFunctionWithIndex:tmpIndex];
}
- (void)changeTopButtonStatusFunctionWithIndex:(NSInteger)index
{
    
    UIButton *btn1 = [_topView viewWithTag:100+index];
    btn1.selected = YES;
    
    _line.frame = CGRectMake(5+(oneWith-[lineWith[0] floatValue])/2+oneWith*index,36 ,[lineWith[0] floatValue], 6);
    
}

@end
