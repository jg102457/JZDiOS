
//
//  Bacony_LabelsViewController9.m
//  Masnory
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "Bacony_LabelsViewController9.h"

@interface Bacony_LabelsViewController9 ()
@property (nonatomic,strong) UILabel *longLabel;
@property (nonatomic,strong) UILabel *shortLabel;
@property (nonatomic,strong) UILabel *contentLable;

@end

@implementation Bacony_LabelsViewController9
- (void)loadView
{
    [super loadView];
    _longLabel  = [[UILabel alloc]init];
    _shortLabel = [[UILabel alloc]init];
    _contentLable = [[UILabel alloc]init];
    [self.view addSubview:_longLabel];
    [self.view addSubview:_shortLabel];
    [self.view addSubview:_contentLable];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"08_Bacony Labels";
    _longLabel.numberOfLines = 0;
    _longLabel.font =[UIFont systemFontOfSize:13];
    _longLabel.backgroundColor = [UIColor redColor];
    _longLabel.textColor = [UIColor darkGrayColor];
    _longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    
    _shortLabel.numberOfLines = 1;
    _shortLabel.textColor = [UIColor purpleColor];
    _shortLabel.backgroundColor = [UIColor yellowColor];
    _shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _shortLabel.text = @"Bacon";
    
    _contentLable.numberOfLines = 0;
    _contentLable.font =[UIFont systemFontOfSize:13];
    _contentLable.backgroundColor = [UIColor greenColor];
    _contentLable.textColor = [UIColor darkGrayColor];
    _contentLable.lineBreakMode = NSLineBreakByTruncatingTail;
    _contentLable.text = @"枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客枫子的博客";
    // 只设置left top
    [_longLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(10);
    }];
    // 只设置 centerY right
    [_shortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_longLabel); //
        make.right.equalTo(self.view).offset(-10);
    }];
    // top left right 根据文字多少自动计算高度
    [_contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_longLabel.mas_bottom).offset(10);
        make.left.equalTo(@10);
        make.right.equalTo(self.view).offset(-10);
    }];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetMinX(self.shortLabel.frame)-10;
    
    width -= CGRectGetMinX(self.longLabel.frame);
    self.longLabel.preferredMaxLayoutWidth = width;
    
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
