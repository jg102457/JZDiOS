//
//  MyTabBar.m
//  Big_WHEEL
//
//  Created by jason on 16/6/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "MyTabBar.h"
#define gray_font_color  [UIColor colorWithRed:28/255.00 green:28/255.00 blue:28/255.00 alpha:1.0f]
#define bg_nav_color  [UIColor colorWithRed:0/255.00 green:160/255.00 blue:233/255.00 alpha:1.0f]
@implementation MyTabBar{
    NSMutableArray *bottomBtnAry;
    NSMutableArray *bottomControlAry;

}
- (void)viewDidLoad{
    self.navigationController.navigationBarHidden=YES;//导航条隐藏
    //隐藏系统的TabBar样式
    self.tabBar.hidden = YES;

}
- (void)createBottomTabBarView:(NSArray *)nameArr andNormarlImageArr:(NSArray *)imageNormalArr andSelectImageArr:(NSArray *)imagePressArr{
    [_tabImgView removeFromSuperview];
    bottomBtnAry  = [[NSMutableArray alloc]init];
    _tabImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    _tabImgView.backgroundColor =[UIColor grayColor];
    _tabImgView .userInteractionEnabled =YES;
    [self.view addSubview:_tabImgView];
    int widthForBtn = ScreenWidth/(nameArr.count);
    for (int i =0 ; i< nameArr.count; i++) {
        UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((widthForBtn*i),0, widthForBtn, 49 );
        
        if (i==0) {
                btn.selected = YES;
            }
        
        [btn setImage:[UIImage imageNamed:imageNormalArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imagePressArr[i]] forState:UIControlStateSelected];
        [btn setTitle:nameArr[i] forState:UIControlStateSelected];
        [btn setTitle:nameArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:gray_font_color forState:UIControlStateNormal];
        [btn setTitleColor:bg_nav_color forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        btn.titleLabel.textAlignment=YES;
        btn.imageEdgeInsets = UIEdgeInsetsMake(-15, (btn.frame.size.width-btn.imageView.frame.size.width)/2, 0, (btn.frame.size.width-btn.imageView.frame.size.width)/2);
        
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(29, -btn.imageView.frame.size.width, 0, 0);
        //  btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        //  btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        // btn.backgroundColor = [UIColor greenColor];
        [btn addTarget:self action:@selector(viewControllerSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
       [_tabImgView addSubview:btn];
       [bottomBtnAry addObject:btn];
    }

}
- (void)addViewControllerArray:(NSArray *)viewControllerArrs{
    bottomControlAry  = [[NSMutableArray alloc]init];
    for (int i=0;i < viewControllerArrs.count;i++) {
        MyNavigation * clientVC = [[MyNavigation alloc]initWithRootViewController:viewControllerArrs[i]];
        [bottomControlAry addObject:clientVC];
    }
    
    //添加到tabBar容器
    self.viewControllers = bottomControlAry;
    //默认显示资讯
    self.selectedIndex = 0 ;
}
- (void)viewControllerSelectedAction:(UIButton *)btn{
  int index = (int)btn.tag-100;
    for (UIButton *selectBtn in bottomBtnAry) {
        if (selectBtn.tag==btn.tag) {
            selectBtn.selected = YES;
        }else{
            selectBtn.selected = NO;
        }
    }
  self.selectedIndex = index;

}
/*允许强制设置横竖屏*/
- (BOOL)shouldAutorotate
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] preferredInterfaceOrientationForPresentation];
}

@end
