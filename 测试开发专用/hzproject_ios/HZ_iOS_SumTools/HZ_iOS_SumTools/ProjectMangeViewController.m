//
//  ProjectMangeViewController.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ProjectMangeViewController.h"

@interface ProjectMangeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong) UITableView *projectTab;
@end

@implementation ProjectMangeViewController{
    
    NSArray *NameArr;
    NSArray *placeArr;
}
- (void)viewWillAppear:(BOOL)animated{
    if (_isAdd) {
        self.title = @"添加项目";
        
    }else{
        self.title = @"项目";
    }
    
    [self creatUI];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    NameArr  = @[@"项目名称",@"项目地址",@"项目报备",@"项目类型",@"经销商",@"负责人",@"项目状态",@"经进货金额",@"收款日期",@"收款金额",@"进货成本",@"发货日期",@"售后"];
    placeArr = @[@"请输入项目名称",@"请输入项目地址",@"请选择",@"请选择",@"请选择",@"请选择",@"请选择",@"请输入",@"请选择",@"请输入",@"请输入",@"请选择",@"请选择"];
    
}

#pragma mark-----------UI
- (void)creatUI{
    
    _projectTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 64
                                                              , ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    _projectTab.backgroundColor = [UIColor redColor];
    _projectTab.delegate= self;
    _projectTab.dataSource =self;
    _projectTab.tableFooterView = [self creatFooterView];
    _projectTab.bounces = NO;
    [self.view addSubview:_projectTab];
}
- (UIView *)creatFooterView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight-64)*0.3)];
    CGFloat viewH = (ScreenHeight-64)*0.3;
    view.backgroundColor = [UIColor whiteColor];
    
    if (_isAdd) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30,viewH-20-40 ,ScreenWidth-60, 40);
        btn.layer.cornerRadius=5;
        btn.clipsToBounds = YES;
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        [btn setBackgroundColor:Color(40, 149, 217)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }else{
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(30,viewH-20-40-10-40 ,ScreenWidth-60, 40);
        btn1.layer.cornerRadius=5;
        btn1.clipsToBounds = YES;
        [btn1 setTitle:@"修改" forState:UIControlStateNormal];
        [btn1 setBackgroundColor:Color(40, 149, 217)];
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(30,viewH-20-40 ,ScreenWidth-60, 40);
        btn2.layer.cornerRadius=5;
        btn2.clipsToBounds = YES;
        [btn2 setTitle:@"删除" forState:UIControlStateNormal];
        [btn2 setBackgroundColor:Color(229, 57, 57)];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn2];
        
        
        
        
    }
    
    return view;
    
}

#pragma mark------Delegate
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  13;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==7||indexPath.row==9||indexPath.row==10||indexPath.row==11) {
     return 2.5 *(ScreenHeight-64)/10;
    }else{
    return (ScreenHeight-64)/10;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *CellIdentifier = @"Cell";
    // 通过indexPath创建cell实例 每一个cell都是单独的
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    @try {
        CGRect textFieldRect = CGRectMake(15.0f,5.0f, 85.0f, (ScreenHeight-64)/10-10);
        UILabel *label = [[UILabel alloc]initWithFrame:textFieldRect];
        label.text= NameArr[indexPath.row];
        label.textColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:label];
       
        if (indexPath.row==0||indexPath.row==1||indexPath.row==7||indexPath.row==9||indexPath.row==10) {
            
                        UITextField *theTextField = [[UITextField alloc] initWithFrame: CGRectMake(100.0f, 5.0f, ScreenWidth-110, (ScreenHeight-64)/10-10)];
                        theTextField.textAlignment = 2;
                        theTextField.clearButtonMode = YES;
                        theTextField.tag = indexPath.row;
                        theTextField.delegate = self;
            
                        //此方法为关键方法
                        [theTextField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
            
                        theTextField.placeholder = placeArr[indexPath.row];
                        
                        
                        [cell.contentView addSubview:theTextField];
            
            if (indexPath.row==7||indexPath.row==9||indexPath.row==10) {
                CGFloat CellH =0.8 *(ScreenHeight-64)/10;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.layer.cornerRadius = CellH/2;
                btn.clipsToBounds = YES;
                btn.frame = CGRectMake(15.0f, (ScreenHeight-64)/10,CellH , CellH);
                [btn setBackgroundColor:[UIColor redColor]];
                [cell.contentView addSubview:btn];
            }
            
        }else{
        
                        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                        btn.frame = CGRectMake(100.0f, 5.0f, ScreenWidth-110, (ScreenHeight-64)/10-10);
                        [btn setTitle:placeArr[indexPath.row] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                        btn.tag = indexPath.row;
                        btn.contentHorizontalAlignment= 2;
            
                        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                        [cell.contentView addSubview:btn];
            if (indexPath.row==11) {
                CGFloat CellH =0.8 *(ScreenHeight-64)/10;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.layer.cornerRadius = CellH/2;
                btn.clipsToBounds = YES;
                btn.frame = CGRectMake(15.0f, (ScreenHeight-64)/10,CellH , CellH);
                [btn setBackgroundColor:[UIColor redColor]];
                [cell.contentView addSubview:btn];
            }
            
        }
        

        
    } @catch (NSException *exception) {
        
        [self showTextOnly:@"数据异常--情况是越界"];
    } @finally {
        
        
    }
    
    
    return cell;
}

- (void)textFieldWithText:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            NSLog(@"----=======%@",textField.text);
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
}



-(void)btnClick:(UIButton *)btn{
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
