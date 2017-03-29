//
//  MasonryViewController.m
//  HZ_iOS_SumTools
//
//  Created by admin on 16/8/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MasonryViewController.h"
#import "ContrastViewController.h"
#import "BasicViewController1.h"
#import "BasicViewController2.h"
#import "Update_ConstraintsViewController3.h"
#import "Remake_ConstraintsViewController4.h"
#import "Using_ConstantsViewController5.h"
#import "Composite_EdgesViewController6.h"
#import "Aspect_FitViewController7.h"
#import "Basic_AnimatedViewController8.h"
#import "Bacony_LabelsViewController9.h"
#import "UIScrollViewViewController10.h"
#import "ArrayViewController11.h"
#import "Attribute_ChainingViewController12.h"
#import "Layout_GuidesViewController13.h"
#import "DFViewController.h"


/*
 https://github.com/SnapKit/Masonry
 
 */

@interface MasonryViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    NSArray * array;
}

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Masonry";
    self.navigationController.navigationBar.translucent = NO;

    array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    // Do any additional setup after loading the view.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0){
        ContrastViewController * vc = [[ContrastViewController alloc] init];
        ;
        vc.title = @"layout";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==1){
        BasicViewController1 * vc = [[BasicViewController1 alloc] init];
        ;
        vc.title = @"居中";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==2){
        BasicViewController2 * vc = [[BasicViewController2 alloc] init];
        ;
        vc.title = @"";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row ==3){
        Update_ConstraintsViewController3 * vc = [[Update_ConstraintsViewController3 alloc] init];
        ;
        vc.title = @"更新约束";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==4){
        Remake_ConstraintsViewController4 * vc = [[Remake_ConstraintsViewController4 alloc] init];
        ;
        vc.title = @"重置约束";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==5){
        Using_ConstantsViewController5 * vc = [[Using_ConstantsViewController5 alloc] init];
        ;
        vc.title = @"子父约束";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==6){
        
        Composite_EdgesViewController6 * vc = [[Composite_EdgesViewController6 alloc] init];
        ;
        vc.title = @"相互约束";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==7){
        Aspect_FitViewController7 * vc = [[Aspect_FitViewController7 alloc] init];
        ;
        vc.title = @"Aspect_FitViewController7";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==8){
        Basic_AnimatedViewController8 * vc = [[Basic_AnimatedViewController8 alloc] init];
        ;
        vc.title = @"动画";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==9){
        Bacony_LabelsViewController9 * vc = [[Bacony_LabelsViewController9 alloc] init];
        ;
        vc.title = @"Label";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==10){
        UIScrollViewViewController10 * vc = [[UIScrollViewViewController10 alloc] init];
        ;
        vc.title = @"ScrollView";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==11){
        ArrayViewController11 * vc = [[ArrayViewController11 alloc] init];
        ;
        vc.title = @"";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==12){
        Attribute_ChainingViewController12 * vc = [[Attribute_ChainingViewController12 alloc] init];
        ;
        vc.title = @"文本基线";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==13){
        Layout_GuidesViewController13 * vc = [[Layout_GuidesViewController13 alloc] init];
        ;
        vc.title = @"";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row==14){
        DFViewController * vc = [[DFViewController alloc] init];
        ;
        vc.title = @"等分";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
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
