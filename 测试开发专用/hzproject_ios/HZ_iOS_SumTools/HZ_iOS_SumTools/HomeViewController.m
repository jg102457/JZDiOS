//
//  HomeViewController.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HomeViewController.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "MJExtension.h"
#import "AgencyModel.h"
#import "SearchView.h"
#import "AgencyDetialViewController.h"
#import "AgencyCell.h"
#import "ProjectMangeViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation HomeViewController{

    NSMutableArray *agencyDataArr;
    NSInteger pageIndex;
    SearchView  *search;
}

- (void)viewWillAppear:(BOOL)animated
{
    MyNavigation *my = (MyNavigation *)self.navigationController;
    my.rightButon.hidden = NO;
    my.backButon.hidden = YES;
    [my.rightButon addTarget:self action:@selector(rightButonClick) forControlEvents:UIControlEventTouchUpInside ];

    [agencyDataArr removeAllObjects];
    pageIndex =1;
    [self dataRequest];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     
     */
    _isProject = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    agencyDataArr = [[NSMutableArray alloc]init];
    pageIndex=1;
    [self creatSearch];
    [self creatTableView];
}
#pragma mark------UI
-(void)creatSearch{
    search = [[SearchView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 40)];
    search.searchTextField.delegate =self;
    [search.searchTextField addDoneOnKeyboardWithTarget:self action:@selector(doneBtnClick)];
    [self.view addSubview:search];
    

}
- (void)creatTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight-104)];
    _tableView.tableFooterView = [UIView new];
    _tableView.dataSource =  self;
    _tableView.delegate = self;
    _tableView.backgroundColor= [UIColor whiteColor];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
         pageIndex=1;
        if (_isProject) {
            
        }else{
            [agencyDataArr removeAllObjects];
            [self dataRequest];
        }
        [_tableView.header endRefreshing];
    }];
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        ++ pageIndex;
        if (_isProject) {
            
        }else{
          [self dataRequest];
        }
        
        [_tableView.footer endRefreshing];
    }];
    [self.view addSubview:_tableView];
    
    /*
     
     */

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30,ScreenHeight-20-40 ,ScreenWidth-60, 40);
    btn.layer.cornerRadius=5;
    btn.clipsToBounds = YES;
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setBackgroundColor:Color(40, 149, 217)];
    [btn addTarget:self action:@selector(loginbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
#pragma mark------request
/*经销商列表*/
- (void)dataRequest{
    NSString *page = [NSString stringWithFormat:@"%ld",pageIndex];
    if (search.searchTextField.text.length <=0) {
        search.searchTextField.text =@"";
    }
    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"RoleID":@"0",@"Keyword":search.searchTextField.text,@"pageindex":page};
    [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/MLK/GetDealerList" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
      
        if ([dataArr[@"returnCode"] integerValue]==1) {
            //正常数据
            [agencyDataArr  addObjectsFromArray:[AgencyModel mj_objectArrayWithKeyValuesArray:dataArr[@"data"]]];
            [_tableView reloadData];
            
        }else{
        
            [self showTextOnly:dataArr[@"msg"]];
        }
     
    } failure:^(id error) {
        
        [self showTextOnly:@"网络异常"];
    }];


}

#pragma mark------Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return agencyDataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (ScreenHeight-104)/9;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AgencyCell *cell = [[AgencyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    @try {
        if (agencyDataArr.count >0) {
          
            if (_isProject) {
                cell.agencyName.text = @"项目名称:.....";
                cell.companyName.text = @"经销商青岛金智达软件有限公司";
                
            }else{
                AgencyModel *model = agencyDataArr[indexPath.row];
                cell.agencyName.text = [NSString stringWithFormat:@"经销商名称:%@",model.DealerName];
                cell.companyName.text = [NSString stringWithFormat:@"公司名称:%@",model.CompanyName];
            }
        }
       

    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (_isProject) {
        ProjectMangeViewController *pro = [[ProjectMangeViewController alloc]init];
        pro.isAdd = NO;
        [self.navigationController pushViewController:pro animated:YES];
    }else{
        AgencyDetialViewController *ageView = [[AgencyDetialViewController alloc]init];
        ageView.agencyModel = agencyDataArr[indexPath.row];
        ageView.isAdd = NO;
        [self.navigationController pushViewController:ageView animated:YES];
    }
    
    

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    [self doneBtnClick];
    
    
    return YES;
    
}
#pragma mark-------taget
- (void)rightButonClick{
    
    if (_isProject) {
        
        ProjectMangeViewController *pro = [[ProjectMangeViewController alloc]init];
        pro.isAdd = YES;
        [self.navigationController pushViewController:pro animated:YES];
    }else{
        AgencyDetialViewController *ageView = [[AgencyDetialViewController alloc]init];
        ageView.isAdd = YES;
        [self.navigationController pushViewController:ageView animated:YES];
    }
    
  

}


- (void)loginbtnClick:(UIButton *)btn{

    [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/JZDUser/Login" andInputKeys:@{@"phone":@"18660260751",@"pwd":@"123456"} andAddHudTo:self.view Success:^(id dataArr) {
        NSLog(@"-----==========%@",dataArr);
        NSArray *arr= dataArr[@"data"];
        [[NSUserDefaults standardUserDefaults] setObject:arr[0][@"CompanyID"] forKey:@"CompanyID"];
        [[NSUserDefaults standardUserDefaults] setObject:arr[0][@"UserID"] forKey:@"UserID"];
        [[NSUserDefaults standardUserDefaults] setObject:arr[0][@"CompanyID"] forKey:@"CompanyID"];
        [[NSUserDefaults standardUserDefaults] setObject:arr[0][@"token"] forKey:@"token"];
//        [[NSUserDefaults standardUserDefaults] setObject:arr[0][@"CompanyID"] forKey:@"CompanyID"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } failure:^(id error) {
      
        NSLog(@"===============%@",error);
    }];
}

- (void)doneBtnClick{

    [search.searchTextField resignFirstResponder];
    if (_isProject) {
        
    }else{
    
        [agencyDataArr removeAllObjects];
        pageIndex=1;
        [self dataRequest];
    }
    
}
- (void)viewWillDisappear:(BOOL)animated{

    
    MyNavigation *my = (MyNavigation *)self.navigationController;
    my.rightButon.hidden = YES;
    my.backButon.hidden = NO;

}

@end
