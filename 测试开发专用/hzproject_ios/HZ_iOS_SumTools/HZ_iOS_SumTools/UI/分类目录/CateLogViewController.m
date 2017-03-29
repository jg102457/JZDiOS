//
//  CateLogViewController.m
//  Big_WHEEL
//
//  Created by jason on 16/8/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "CateLogViewController.h"

@interface CateLogViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CateLogViewController{
    NSArray *secLabelArray;
    NSArray *arrayDictKey;
    NSMutableDictionary *arrayDict;
    UITableView *tableView;
     NSArray *listarray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    MyNavigation *myNav = (MyNavigation *)self.navigationController;
//    myNav.navigationBar.hidden = NO;
//    [ myNav.backButon setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    myNav.rightButon.hidden = NO;
   // myNav.navBackColor = [UIColor redColor];
//    myNav.navBackImage = [UIImage imageNamed:@"zc@2x"];
    NSArray *array = [[NSArray alloc] initWithObjects:@"你好", @"BFlower",
                      @"CGrass", @"DFence", @"EHouse", @"FTable", @"GChair",
                      @"HBook", @"ISwing" ,@"JWang" ,@"KDong" ,@"LNi" ,@"MHao" ,@"Na" ,@"Oa" ,@"Pa" ,@"Qa" ,@"Ra" ,@"Sa" ,@"Ta" ,@"Ua" ,@"Va" ,@"Wa" ,@"Xa" ,@"Ya" ,@"Za", nil];
    listarray = array;
   
    secLabelArray = [[NSArray alloc] initWithObjects:@"A", @"B", @"C",@"D", @"E", @"F",@"G", @"H", @"I",@"J", @"K", @"L",@"M", @"N", @"O",@"P", @"Q", @"R",@"S", @"T", @"U",@"V", @"W", @"X",@"Y", @"Z", nil];
    
    NSArray *arrayA = [[NSArray alloc] initWithObjects:@"测试A1",@"测试A2", nil];
    NSArray *arrayB = [[NSArray alloc] initWithObjects:@"测试B1",@"测试B2",@"测试B3", nil];
    NSArray *arrayC = [[NSArray alloc] initWithObjects:@"测试C1",@"测试C2",@"测试C3",@"测试C4", nil];
    NSArray *arrayD = [[NSArray alloc] initWithObjects:@"测试D1",@"测试D2",@"测试D3",@"测试D4",@"测试D5", nil];
    NSArray *arrayE = [[NSArray alloc] initWithObjects:@"测试E1",@"测试E2",@"测试E3",@"测试E4",@"测试E5",@"测试E6", nil];
    NSArray *arrayF = [[NSArray alloc] initWithObjects:@"测试F1",@"测试F2",@"测试F3",@"测试F4",@"测试F5",@"测试F6",@"测试F7", nil];
    NSArray *arrayG = [[NSArray alloc] initWithObjects:@"测试G1",@"测试G2",@"测试G3",@"测试G4",@"测试G5",@"测试G6", nil];
    arrayDictKey = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G", nil];
    arrayDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:arrayA,[arrayDictKey objectAtIndex:0],
                 arrayB,[arrayDictKey objectAtIndex:1],
                 arrayC,[arrayDictKey objectAtIndex:2],
                 arrayD,[arrayDictKey objectAtIndex:3],
                 arrayE,[arrayDictKey objectAtIndex:4],
                 arrayF,[arrayDictKey objectAtIndex:5],
                 arrayG,[arrayDictKey objectAtIndex:6],
                 nil];
//    NSLog(@"arrayrow:%d",[[arrayDict objectForKey:[arrayDictKey objectAtIndex:1]] count]);
    
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth , ScreenHeight)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    //[tableView release];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
    //* 出现几组
    //if(aTableView == self.tableView) return 27;
    return [arrayDict count];
}

//*字母排序搜索
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //* 字母索引列表
    /*NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
     
     for(char c= 'A';c<='Z';c++)
     
     [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];*/
    
    return arrayDictKey;
    
    /*NSMutableArray *newarr=[[NSMutableArray alloc]initWithArray:listarray];
     [newarr addObject:@"{search}"]; //等价于[arr addObject:UITableViewIndexSearch];
     return newarr;*/
    
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //搜索时显示按索引第几组
    NSInteger count = 0;
    NSLog(@"%@",title);
    for(NSString *character in arrayDictKey)
    {
        
        if([character isEqualToString:title])
        {
            
            return count;
            
        }
        
        count ++;
        
    }
    
    return count;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    /*if([listarray count]==0)
     
     {
     
     return @"";
     
     }*/
    
    //return [listarray objectAtIndex:section];   //*分组标签
    return [arrayDictKey objectAtIndex:section];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.listarray count];    //*每组要显示的行数
    //NSInteger i = [[listarray objectAtIndex:section] ]
    NSInteger i =  [[arrayDict objectForKey:[arrayDictKey objectAtIndex:section]] count];
    return i;
}

-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    //返回类型选择按钮
    
    return UITableViewCellAccessoryDisclosureIndicator;   //每行右边的图标
}
- (UITableViewCell *)tableView:(UITableView *)tableview
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSUInteger sectionMy = [indexPath section];
    NSLog(@"sectionMy:%d",sectionMy);
    
    cell.textLabel.text = [[arrayDict objectForKey:[arrayDictKey objectAtIndex:sectionMy]] objectAtIndex:row]; //每一行显示的文字
    
    NSString *str=  [NSString stringWithFormat: @"%d", row];
    
    UIImage *image = [UIImage imageNamed:str];
    cell.imageView.image = image;
    UIImage *highLighedImage = [UIImage imageNamed:@"1.png"];
    
    cell.imageView.highlightedImage = highLighedImage; //选中一行时头部图片的改变
    return cell;
}
//划动cell是否出现del按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return YES;  //是否需要删除图标
}
//编辑状态(不知道干什么用)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self viewDidLoad];
}

//选中时执行的操作
- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    if (row%2 == 0) {
        NSUInteger row = [indexPath row];
        NSString *rowValue = [listarray objectAtIndex:row];
        
        NSString *message = [[NSString alloc] initWithFormat:
                             @"You selected %@", rowValue];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Row Selected!"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"Yes I Did"
                              otherButtonTitles:nil];
        [alert show];
        
    }
    return indexPath;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //这里控制值的大小
    return 50.0;  //控制行高
    
}

/*
#pragma mark - Navigation
界面跳转 事件处理
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
