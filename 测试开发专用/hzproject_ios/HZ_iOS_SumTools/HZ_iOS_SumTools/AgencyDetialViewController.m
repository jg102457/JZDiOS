//
//  AgencyDetialViewController.m
//  HZ_iOS_SumTools
//
//  Created by jzd on 17/3/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AgencyDetialViewController.h"
#import "AgencyMethod.h"
#import "MJExtension.h"
#import "MyYPickView.h"
#import "xialaTableView.h"
@interface AgencyDetialViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong) UITableView *agencyTab;
@end

@implementation AgencyDetialViewController{

    
    NSArray *NameArr;
    NSArray *placeArr;
    NSMutableArray *ParaArr;
}
- (void)viewWillAppear:(BOOL)animated{
    if (_isAdd) {
        self.title = @"添加经销商";
        /*初始化model*/
        _agencyModel= [[AgencyModel alloc]init];
        [self creatUI];
  
        
    }else{
        self.title = @"经销商";
        [AgencyMethod returnNameAccordingTo:_agencyModel.Level Success:^(id string) {
            _agencyModel.ParaName = string;
            [self creatUI];
            
        }];
        
    }

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    NameArr  = @[@"经销商名称",@"公司名称",@"地址",@"电话",@"QQ",@"微信",@"E-mail",@"经销商等级",@"大区负责人"];
    placeArr = @[@"请输入经销商",@"请输入公司名称",@"请输入地址",@"请输入电话",@"请输入QQ",@"请输入微信",@"请输入e-mail",@"请选择",@"请选择"];
    ParaArr = [[NSMutableArray alloc]init];
    
}

#pragma mark-----------UI
- (void)creatUI{

    _agencyTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 64
                                                              , ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    _agencyTab.backgroundColor = [UIColor redColor];
    _agencyTab.delegate= self;
    _agencyTab.dataSource =self;
    _agencyTab.tableFooterView = [self creatFooterView];
    _agencyTab.bounces = NO;
    [self.view addSubview:_agencyTab];
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
        [btn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }else{
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(30,viewH-20-40-10-40 ,ScreenWidth-60, 40);
        btn1.layer.cornerRadius=5;
        btn1.clipsToBounds = YES;
        [btn1 setTitle:@"修改" forState:UIControlStateNormal];
        [btn1 setBackgroundColor:Color(40, 149, 217)];
        [btn1 addTarget:self action:@selector(updateAgency) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(30,viewH-20-40 ,ScreenWidth-60, 40);
        btn2.layer.cornerRadius=5;
        btn2.clipsToBounds = YES;
        [btn2 setTitle:@"删除" forState:UIControlStateNormal];
        [btn2 setBackgroundColor:Color(229, 57, 57)];
        [btn2 addTarget:self action:@selector(removeAgency) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn2];
        
        
       
    
    }
    
    return view;
    
}
#pragma mark----request
/*经销商验证(有问题)*/
-(void)checkAgencyRequest{

    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"RoleID":@"0",@"DealerID":_agencyModel.DealerName,@"ComPanyName":_agencyModel.CompanyName,@"Address":_agencyModel.Address,@"Phone":_agencyModel.Phone,@"QQ":_agencyModel.QQ,@"WeChat":_agencyModel.WeChat,@"Email":_agencyModel.Email,@"Level":_agencyModel.Level,@"RegionalHeadUserID":@"H0000003"};
    [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/MLK/AddDealer" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
        
        if ([dataArr[@"returnCode"] integerValue]==1) {
            //正常数据
            [self showTextOnly:@"添加成功"];
            [self performSelector:@selector(backToLastPage) withObject:nil afterDelay:1];
            
        }
        
    } failure:^(id error) {
        
        NSLog(@"===============%@",error);
    }];
    
    


}
/*新增经销商*/
- (void)addRequest{
    
    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"RoleID":@"0",@"DealerName":_agencyModel.DealerName,@"ComPanyName":_agencyModel.CompanyName,@"Address":_agencyModel.Address,@"Phone":_agencyModel.Phone,@"QQ":_agencyModel.QQ,@"WeChat":_agencyModel.WeChat,@"Email":_agencyModel.Email,@"Level":_agencyModel.Level,@"RegionalHeadUserID":@"H0000003"};
        [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/MLK/AddDealer" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
            
            if ([dataArr[@"returnCode"] integerValue]==1) {
                //正常数据
                [self showTextOnly:@"添加成功"];
                [self performSelector:@selector(backToLastPage) withObject:nil afterDelay:1];
                
            }else{
            
                [self showTextOnly:dataArr[@"msg"]];
            }
            
        } failure:^(id error) {
            
            NSLog(@"===============%@",error);
        }];
        
        
    

}
/*修改经销商*/
- (void)updateAgencyRequest{

    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"RoleID":@"0",@"DealerID":_agencyModel.DealerID,@"DealerName":_agencyModel.DealerName,@"ComPanyName":_agencyModel.CompanyName,@"Address":_agencyModel.Address,@"Phone":_agencyModel.Phone,@"QQ":_agencyModel.QQ,@"WeChat":_agencyModel.WeChat,@"Email":_agencyModel.Email,@"Level":_agencyModel.Level,@"RegionalHeadUserID":@"H0000003"};
    [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/MLK/EditDealer" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
        
        if ([dataArr[@"returnCode"] integerValue]==1) {
            //正常数据
            [self showTextOnly:@"修改成功"];
            
            
        }else{
            [self showTextOnly:dataArr[@"msg"]];
        }
        
    } failure:^(id error) {
        
        NSLog(@"===============%@",error);
    }];
    


}
/*删除经销商*/
-(void)deleteAgencyRequst{

    NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"RoleID":@"0",@"DealerID":_agencyModel.DealerID};
    [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/MLK/DeleteDealer" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
        
        if ([dataArr[@"returnCode"] integerValue]==1) {
            //正常数据
            [self showTextOnly:@"删除成功"];
            [self performSelector:@selector(backToLastPage) withObject:nil afterDelay:1];
            
            
        }else{
            [self showTextOnly:dataArr[@"msg"]];
        }
        
    } failure:^(id error) {
        
        NSLog(@"===============%@",error);
    }];
    

}
#pragma mark------Delegate
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (ScreenHeight-64)/9 * 0.7;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    static NSString  *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    @try {
        
        cell.textLabel.text =NameArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor= [UIColor grayColor];
        
        if (indexPath.row <= 6) {
            CGRect textFieldRect = CGRectMake(100.0f, 5.0f, ScreenWidth-110, (ScreenHeight-64)/9 * 0.7-10);
            UITextField *theTextField = [[UITextField alloc] initWithFrame:textFieldRect];
            theTextField.textAlignment = 2;
            theTextField.clearButtonMode = YES;
            theTextField.tag = indexPath.row;
            if (indexPath.row==3||indexPath.row==4) {
                theTextField.keyboardType= UIKeyboardTypeNumberPad;
            }
            theTextField.delegate = self;
            
            //此方法为关键方法
            [theTextField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
            
            theTextField.placeholder = placeArr[indexPath.row];
            
            if (!_isAdd) {
                switch (indexPath.row) {
                    case 0:
                        theTextField.text = _agencyModel.DealerName;
                        break;
                    case 1:
                        theTextField.text = _agencyModel.CompanyName;
                        break;
                    case 2:
                        theTextField.text = _agencyModel.Address;
                        break;
                    case 3:
                        theTextField.text = _agencyModel.Phone;
                        break;
                    case 4:
                        theTextField.text = _agencyModel.QQ;
                        break;
                    case 5:
                        theTextField.text = _agencyModel.WeChat;
                        break;
                    case 6:
                        theTextField.text = _agencyModel.Email;
                        break;
                        
                    default:
                        break;
                }
                
            }
            
            [cell.contentView addSubview:theTextField];
        }else{
         
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(100.0f, 5.0f, ScreenWidth-110, (ScreenHeight-64)/9 * 0.7-10);
            if (_isAdd) {
                [btn setTitle:placeArr[indexPath.row] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            }else{
                if (indexPath.row==7) {
                    [btn setTitle:_agencyModel.ParaName forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                if (indexPath.row==8) {
                    [btn setTitle:_agencyModel.RegionalHeadUserID forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                
            }
           
            btn.tag = indexPath.row;
            btn.contentHorizontalAlignment= 2;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:btn];
            
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
            //经销商名称
            _agencyModel.DealerName = textField.text;
            break;
        case 1:
            //公司名称
            _agencyModel.CompanyName = textField.text;
            break;
        case 2:
            //地址
            _agencyModel.Address = textField.text;
            break;
        case 3:
            //电话
            _agencyModel.Phone = textField.text;
            break;
        case 4:
            //QQ
            _agencyModel.QQ = textField.text;
            break;
        case 5:
            //微信
            _agencyModel.WeChat = textField.text;
            break;
        case 6:
            //邮件
            _agencyModel.Email = textField.text;
            break;
        default:
            break;
    }
}
#pragma mark-------taget
-(void)btnClick:(UIButton *)btn{

    if (btn.tag==7) {
      
        if (ParaArr.count >0) {
            //已经点击过去取出数据

            NSMutableArray *ParaNameArr = [NSMutableArray array];
            for (NSDictionary *ParaName in ParaArr) {
                
                [ParaNameArr addObject:ParaName[@"ParaName"]];
                
            }
            MyYPickView *view =[[MyYPickView alloc]initWithDataArr:ParaNameArr];
            
            [view setResult:^(NSString *select, NSInteger num) {
                [btn setTitle:select forState:UIControlStateNormal];
                _agencyModel.ParaName = select;
                _agencyModel.Level = ParaArr[num][@"ParaID"];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }];
            [self.view addSubview:view];
        }else{
        
            NSDictionary *dic = @{@"CompanyID":@"GS0000001",@"UserID":@"H0000003",@"token":TOOKENNEW,@"PID":@"14"};
            [HTTPTools postAFHttPSessionWithURL:@"http://192.168.0.200:8001/Parameter/GetParameterList" andInputKeys:dic andAddHudTo:self.view Success:^(id dataArr) {
                
                if ([dataArr[@"returnCode"] integerValue]==1) {
                    //正常数据
                    ParaArr = dataArr[@"data"];
                    NSMutableArray *ParaNameArr = [NSMutableArray array];
                    for (NSDictionary *ParaName in ParaArr) {
                        
                        [ParaNameArr addObject:ParaName[@"ParaName"]];
                        
                    }
                    MyYPickView *view =[[MyYPickView alloc]initWithDataArr:ParaNameArr];
                    
                    [view setResult:^(NSString *select, NSInteger num) {
                        [btn setTitle:select forState:UIControlStateNormal];
                        _agencyModel.ParaName = select;
                        _agencyModel.Level = ParaArr[num][@"ParaID"];
                        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    }];
                    [self.view addSubview:view];
                    
                }
            } failure:^(id error) {
                
                
            }];
            

        
        }
        

    }
    if (btn.tag==8) {
       
        _agencyModel.RegionalHeadUserID = @"H0000003";
        xialaTableView *xia = [xialaTableView creatNewViewWithFrame:CGRectMake(ScreenWidth-100-60, 64+(ScreenHeight-64)*0.7, 100, 250) contentData:@[@"测试1号数字",@"测试1号数字",@"测试1号数字",@"测试1号数字",@"测试1号数字",@"测试7号数字"] modelArr:nil OnView:self.view];
        [xia setResult:^(NSString *didslect , NSArray *arr, NSInteger num) {
            
        }];
        

    }



}
- (void)addBtnClick{

   
    //数据验证(后面 改到抽象类中写此方法验证 )
    /*经销商不为空 88  公司名称不为空  88  地址不为空*/
    if (_agencyModel.DealerName.length <= 0) {
        
        [self showTextOnly:@"经销商名称不能为空"];
        return;
    }
    if (_agencyModel.CompanyName.length <= 0) {
        
        [self showTextOnly:@"公司名称不能为空"];
        return;
    }
    if (_agencyModel.Address.length <= 0) {
        
        [self showTextOnly:@"地址不能为空"];
        return;
    }
    /*手机号正则验证*/
    if (_agencyModel.Phone.length <=0) {
        _agencyModel.Phone = @"";
    }else{
        //
        if (![UIUtils validateMobile:_agencyModel.Phone]) {
            [self showTextOnly:@"手机号格式错误"];
            return;
        }
    }
    /**qq**weixin**email**/
    if(_agencyModel.QQ.length <=0){
        _agencyModel.QQ=@"";
    }
    if(_agencyModel.WeChat.length <=0){
        _agencyModel.WeChat=@"";
    }
    if(_agencyModel.Email.length <=0){
        _agencyModel.Email=@"";
    }else{
        
        if (![UIUtils IsEmailAdress:_agencyModel.Email]) {
            [self showTextOnly:@"邮箱格式错误"];
            return;
        }
    }
    /*经销商等级验证*/
    if (_agencyModel.Level.length <=0) {
        [self showTextOnly:@"请选择经销商等级"];
        return;
    }
    if(_agencyModel.RegionalHeadUserID.length <=0){
        
        [self showTextOnly:@"请选择大区负责人"];
        return;
    }
    
    

        //新增
    [self addRequest];
}
- (void)updateAgency{
    //数据验证(后面 改到抽象类中写此方法验证 )
    /*经销商不为空 88  公司名称不为空  88  地址不为空*/
    
    
    /*新的的当户恶化*/
    
    
    
    
    
    
    if (_agencyModel.DealerName.length <= 0) {
        
        [self showTextOnly:@"经销商名称不能为空"];
        return;
    }
    if (_agencyModel.CompanyName.length <= 0) {
        
        [self showTextOnly:@"公司名称不能为空"];
        return;
    }
    if (_agencyModel.Address.length <= 0) {
        
        [self showTextOnly:@"地址不能为空"];
        return;
    }
    /*手机号正则验证*/
    if (_agencyModel.Phone.length <=0) {
        _agencyModel.Phone = @"";
    }else{
        //
        if (![UIUtils validateMobile:_agencyModel.Phone]) {
            [self showTextOnly:@"手机号格式错误"];
            return;
        }
    }
    /**qq**weixin**email**/
    if(_agencyModel.QQ.length <=0){
        _agencyModel.QQ=@"";
    }
    if(_agencyModel.WeChat.length <=0){
        _agencyModel.WeChat=@"";
    }
    if(_agencyModel.Email.length <=0){
        _agencyModel.Email=@"";
    }else{
        
        if (![UIUtils IsEmailAdress:_agencyModel.Email]) {
            [self showTextOnly:@"邮箱格式错误"];
            return;
        }
    }
    /*经销商等级验证*/
    if (_agencyModel.Level.length <=0) {
        [self showTextOnly:@"请选择经销商等级"];
        return;
    }
    if(_agencyModel.RegionalHeadUserID.length <=0){
        
        [self showTextOnly:@"请选择大区负责人"];
        return;
    }
    
    

    [self updateAgencyRequest];
    
}
- (void)removeAgency{
    UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"删除" message:@"确定要删除该经销商么" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self deleteAgencyRequst];
    }];
    [alert addAction:action];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}
#pragma mark========method
-(void)cheackAgency{

    

}
- (void)backToLastPage{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
