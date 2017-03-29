//
//  Layout_GuidesViewController13.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Layout_GuidesViewController13.h"

@interface Layout_GuidesViewController13 ()

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation Layout_GuidesViewController13

-(void)loadView
{
    [super loadView];
    _topView    = [[UIView alloc]init];
    _bottomView = [[UIView alloc]init];
    [self.view addSubview:_topView];
    [self.view addSubview:_bottomView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _topView.backgroundColor = UIColor.greenColor;
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *topLayoutGuide = (id)self.topLayoutGuide; //显示屏幕内容的垂直程度最高,使用自动布局的约束。(只读)
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    _bottomView.backgroundColor = UIColor.redColor;
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *bottomLayoutGuide = (id)self.bottomLayoutGuide;
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    // Do any additional setup after loading the view.
}

/*
 
 示例12,需要修改一处代码,运行时会导致程序崩溃,( -[_UILayoutSpacer mas_bottom]: unrecognized selector sent to instance 0x7fbc48cd8980)不知道什么原因
 把这两行代码
 UIView *topLayoutGuide = (id)self.topLayoutGuide; //显示屏幕内容的垂直程度最高,使用自动布局的约束。(只读)
 make.top.equalTo(topLayoutGuide.mas_bottom);
 更改为====> make.top.equalTo(self.mas_topLayoutGuide);
 就好了!!(下面的也一样)
 
 
 */

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
