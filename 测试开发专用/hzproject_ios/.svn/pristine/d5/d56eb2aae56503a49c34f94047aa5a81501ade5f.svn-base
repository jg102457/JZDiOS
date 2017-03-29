//
//  LanchViewController.m
//  Big_WHEEL
//
//  Created by jason on 16/7/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "LanchViewController.h"
//#import "LoginViewController.h"
@interface LanchViewController ()<UIScrollViewDelegate>
{
    
    UIScrollView *scrollView; //用于存放并显示引导页
}
@end

@implementation LanchViewController
- (id)initWithImageArr:(NSArray *)imageArr{
    if (self = [super init]) {
        self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        [self createUI:imageArr];
    }
    return self;
}
+(instancetype)creatLanchViewWithImageArr:(NSArray *)imageArr{

    return [[LanchViewController alloc] initWithImageArr:imageArr];
}
- (void)viewWillAppear:(BOOL)animated{

 self.navigationController.navigationBar.hidden = YES;
}
- (void)createUI:(NSArray *)imageArr
{
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;

    //初始化UI控件
    scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
   // scrollView.backgroundColor =[ UIColor redColor];
    scrollView.contentSize  = CGSizeMake(imageArr.count*ScreenWidth,0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled=YES;
    [self.view addSubview:scrollView];
    
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, ScreenHeight-50, ScreenWidth, 10)];
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.0];
    [self.view addSubview:_pageControl];
    _pageControl.numberOfPages=imageArr.count;
    
    [self createImageView:imageArr];
    
}
-(void)createImageView:(NSArray *)imageArr{

    for (int i =0; i<imageArr.count; i++) {
      UIView *view = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*i,0 ,ScreenWidth,ScreenHeight)];
          //  view.backgroundColor = [UIColor greenColor];
            [scrollView addSubview:view];
        UIImageView * imageViewOne= [[UIImageView alloc] initWithFrame:self.view.frame];
        imageViewOne.contentMode = UIViewContentModeScaleAspectFit;
        imageViewOne.image = [UIImage imageNamed:imageArr[i]];
        imageViewOne.userInteractionEnabled = YES;
        [view addSubview:imageViewOne];
        
        if (i==imageArr.count-1) {
            //按钮样式
            _btn = [Tools initWithNormalFrame:CGRectMake(ScreenWidth-80-20, ScreenHeight-20-30, 80, 30) ButtonWithText:@"进入" andfont:[UIFont systemFontOfSize:14] andImage:nil andSelectImage:nil];
            
            [_btn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
            [imageViewOne addSubview:_btn];
            
            
        }
        
       
    }
    
    
}

- (void)loginBtn{
    //_putInBtnClick(@"123");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat num = scrollView.contentOffset.x;
    int page = num/ScreenWidth;
    _pageControl.currentPage = page;
    NSLog(@"%d",page);

}

@end
