//
//  AgencyCell.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AgencyCell.h"

@implementation AgencyCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
        self.selectionStyle= UITableViewCellSelectionStyleNone;
    }
    return self;

}
- (void)creatUI{
    CGFloat cellHeight = (ScreenHeight-104)/9;
    
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10,cellHeight-20 ,cellHeight-20 )];
    _headImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_headImageView];

    _agencyName = [Tools initWithNormalFrame:CGRectMake(10+cellHeight, 10, ScreenWidth-cellHeight-10,(cellHeight-20)/2 ) LabelwithText:nil andfont:[UIFont systemFontOfSize:16]];
    _agencyName.textColor = [UIColor blackColor];
    _agencyName.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_agencyName];
    
    _companyName =[Tools initWithNormalFrame:CGRectMake(10+cellHeight, 10+(cellHeight-20)/2, ScreenWidth-cellHeight-10,(cellHeight-20)/2 ) LabelwithText:nil andfont:[UIFont systemFontOfSize:14]];
    _companyName.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_companyName];
    
    UIImageView *image  = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-14-12, (cellHeight-14)/2, 14,14 )];
    image.image=[UIImage imageNamed:@"更多1.png"];
    [self.contentView addSubview:image];
}
@end
