//
//  ViewController.m
//  
//
//  Created by jason on 16/9/21.
//
//

#import "ViewController.h"
#import "JSPathDemoViewController.h"
#import "PhotesChoiceViewController.h"
#import "CateLogViewController.h"
#import "QRCodeViewController.h"
#import "GCDViewController.h"
#import "HZDownChoiceViewController.h"
#import "VideoTitleListViewController.h"
#import "FaceImangeViewController.h"
#import "DrawLineViewController.h"
#import "MJEXViewController.h"
#import "TTSViewController.h"

#import "MJRefresh.h"
#import <AVFoundation/AVFoundation.h>

#import "Model.h"
#import "CoreDateAPI.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *mqTableView;
@property (nonatomic,strong) NSArray *arr;
@end

@implementation ViewController{


    AVAudioPlayer *player;}


//- (void) handlePinch:(UIPinchGestureRecognizer*) recognizer
//{
//    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
//    recognizer.scale = 1;
//}
- (void)viewDidLoad
{
    
//    Model *model = [[Model alloc]init]; ;

//    NSString *fileName = model.fileName;
//    NSString *fileSize = [NSString stringWithFormat:@"%.2lf",model.size];
//    NSString *urlPath = model.path;
//    NSNumber *time = [NSNumber numberWithInt:[[DateManager sharedInstance] getSecondsSince1970]];
//    NSNumber *fileType = [NSNumber numberWithInt:model.fileType];
//    NSNumber *finishStatus = [NSNumber numberWithBool:NO];
//    NSDictionary *dict = NSDictionaryOfVariableBindings(fileName,fileSize,urlPath,time,fileType,finishStatus);
//   NSString *path= [[[NSFileManager shardInstance] getDocumentPath] stringByAppendingPathComponent:];
    UILabel *label = [[UILabel alloc]init];
    
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];;
    path=[path stringByAppendingPathComponent:@"Upload.sqlite"];
    CoreDateAPI *core = [[CoreDateAPI alloc]initWithCoreData:@"Model" modelName:@"HZModel" sqlPath:path success:^{
        
    } fail:^(NSError *error) {
        
    }];
    NSURL *rul;
    
//    [rul host]
    /*
     可for循环调用 多次插入
     
     */
//    [core insertNewEntity:@{@"age":@"12",@"sex":@"12",@"name":@"lisa",@"height":@"12",@"weight":@"12",@"direction":@"123"} success:^{
//        
//        NSLog(@"ddgddggdgdgdgdgdggdgdd6666666555");
//    } fail:^(NSError *error) {
//        
//    }];
//    [core updateEntity:^{
//        NSLog(@"ddhsjhdasjdhas jdYYYYYY");
//    } fail:^(NSError *error) {
//        
//    }];
//    
//    [core readEntity:nil ascending:NO filterStr:nil  success:^(NSArray *results) {
//        NSLog(@"0--------%@",results);
////        Model *coreMO = results[0];
////        NSLog(@"%@",coreMO.sex);
////        NSLog(@"0--------%d",results.count);
//    } fail:^(NSError *error) {
//        
//    }];
    
    [HTTPTools startAFNetworkStatus:^(NSString *netStatus) {
        NSLog(@"%@",netStatus);
    }];
    self.title =@"HZ_IOS框架演示";
    
    
    UITableView* tv = [[UITableView alloc]initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.mqTableView = tv;
    self.mqTableView.delegate = self;
    self.mqTableView.dataSource = self;
    self.mqTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.mqTableView];
    
    _arr = @[@"JSPath热修复",@"微信多图选择",@"分类目录结构",@"二维码扫描",@"GCD多线程异步图片下载",@"下拉框",@"视频流播放",@"人脸识别",@"画图板",@"MJExtension",@"TTS语音合成"];
    
}
#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* i=  @"cell";
    UITableViewCell* cell = [tableView  dequeueReusableCellWithIdentifier:i];
    if (cell == nil ) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:i];
    }
    cell.textLabel.text = _arr[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0) {
        JSPathDemoViewController *dem0 = [[JSPathDemoViewController  alloc]init];
        [self.navigationController pushViewController:dem0 animated:YES];
    }
    if (indexPath.row==1) {
        PhotesChoiceViewController *dem1 = [[PhotesChoiceViewController  alloc]init];
        [self.navigationController pushViewController:dem1 animated:YES];
    }
    if (indexPath.row==2) {
        CateLogViewController *dem2 = [[CateLogViewController  alloc]init];
        [self.navigationController pushViewController:dem2 animated:YES];
    }
    if (indexPath.row==3) {
        QRCodeViewController *dem3 = [[QRCodeViewController  alloc]init];
        [self.navigationController pushViewController:dem3 animated:YES];
    }
    if (indexPath.row==4) {
        GCDViewController *dem4 = [[GCDViewController  alloc]init];
        [self.navigationController pushViewController:dem4 animated:YES];
    }
    if (indexPath.row==5) {
        HZDownChoiceViewController *dem5 = [[HZDownChoiceViewController  alloc]init];
        [self.navigationController pushViewController:dem5 animated:YES];
    }
    if (indexPath.row==6) {
        VideoTitleListViewController *dem6 = [[VideoTitleListViewController  alloc]init];
        [self.navigationController pushViewController:dem6 animated:YES];
    }if (indexPath.row==7) {
        [HTTPTools startAFNetworkStatus:^(NSString *netStatus) {
            NSLog(@"%@",netStatus);
        }];
//        FaceImangeViewController *dem7 = [[FaceImangeViewController  alloc]init];
//        [self.navigationController pushViewController:dem7 animated:YES];
    }
    if (indexPath.row==8) {
        DrawLineViewController *line = [[DrawLineViewController alloc]init];
        [self.navigationController pushViewController:line animated:YES];
    }
    if (indexPath.row==9) {
        [player play];
//        MJEXViewController *line = [[MJEXViewController alloc]init];
//        [self.navigationController pushViewController:line animated:YES];
    }
    if (indexPath.row==10) {
        [player play];
                TTSViewController *line = [[TTSViewController alloc]init];
                [self.navigationController pushViewController:line animated:YES];
    }


    
  
  
    
    
}
- (void)hh{
    [Tools Addtarget:self select:@selector(cc) andTitle:@"热修复完成"];
}
- (void)cc{

}
@end
