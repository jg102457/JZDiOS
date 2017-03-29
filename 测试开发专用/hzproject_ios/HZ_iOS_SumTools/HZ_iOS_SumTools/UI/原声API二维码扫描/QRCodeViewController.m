//
//  QRCodeViewController.m
//  Big_WHEEL
//
//  Created by jason on 16/8/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "QRCodeViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface QRCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>//用于处理采集信息的代理
{
    AVCaptureSession * session;//输入输出的中间桥梁
    UIView *_boxView;
    CALayer *_scanLayer;
}

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"*******%@",self.navigationController);
    MyNavigation *myNav = (MyNavigation *)self.navigationController;
    myNav.navigationBar.hidden = YES;
    [ myNav.backButon setBackgroundColor:[UIColor redColor]];
    myNav.navigationItem.hidesBackButton = YES;
  //  [myNav.navigationBar removeFromSuperview];
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;

    [self.view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [session startRunning];
//    //
//    UIView *view = [[UIView alloc]init];
//    view.frame = self.view.frame;
    self.view.backgroundColor = [UIColor clearColor];
  //  [self.view addSubview:view];
     UIBezierPath *bPath = [UIBezierPath bezierPathWithRect:self.view.frame];
    UIBezierPath *bsPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(layer.bounds.size.width * 0.2f, layer.bounds.size.height * 0.3f, layer.bounds.size.width - layer.bounds.size.width * 0.4f, layer.bounds.size.width - layer.bounds.size.width * 0.4f) cornerRadius:0];
    [bPath appendPath:bsPath];//追加
    
    //在设置了shapeLayer的fillRule后这个设置就不起作用了
    bPath.usesEvenOddFillRule = YES;
    //    bPath.usesEvenOddFillRule = NO;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6].CGColor;
    
    //        shapeLayer.fillRule = kCAFillRuleNonZero;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    
    //    shapeLayer.lineWidth = 5;
    //        shapeLayer.lineJoin = kCALineJoinBevel;
    //        shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bPath.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];

//    //10.1.扫描框
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(layer.bounds.size.width * 0.2f, layer.bounds.size.height * 0.3f, layer.bounds.size.width - layer.bounds.size.width * 0.4f, layer.bounds.size.width - layer.bounds.size.width * 0.4f)];
    
    _boxView.layer.borderColor = [UIColor greenColor].CGColor;
    _boxView.layer.borderWidth = 1.0f;
    [self.view addSubview:_boxView];
    UILabel *label = [Tools initWithNormalFrame:CGRectMake(0, layer.bounds.size.height * 0.3f+layer.bounds.size.width - layer.bounds.size.width * 0.4f+15, layer.bounds.size.width,30 ) LabelwithText:@"我的二维码" andfont:[UIFont systemFontOfSize:16]];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.userInteractionEnabled = YES;
    btn.frame = CGRectMake(15, 35, 24, 24);
    [btn setBackgroundImage:[UIImage imageNamed:@"wihte_bangwencontentDnBackP"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
//    //10.2.扫描线
    _scanLayer = [[CALayer alloc] init];
    _scanLayer.frame = CGRectMake(0, 0, _boxView.bounds.size.width, 1);
    _scanLayer.backgroundColor = [UIColor greenColor].CGColor;
    [_boxView.layer addSublayer:_scanLayer];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.08f target:self selector:@selector(moveScanLayer:) userInfo:nil repeats:YES];
    [timer fire];
}
- (void)btnClick{

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)moveScanLayer:(NSTimer *)timer
{
    CGRect frame = _scanLayer.frame;
    if (_boxView.frame.size.height < _scanLayer.frame.origin.y) {
        frame.origin.y = 0;
        _scanLayer.frame = frame;
    }else{
        frame.origin.y += 5;
        [UIView animateWithDuration:0.1 animations:^{
            _scanLayer.frame = frame;
        }];
    }
}

//之后我们的UI上已经可以看到摄像头捕获的内容，只要实现代理中的方法，就可以完成二维码条形码的扫描：

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
//        NSLog(@"%@",metadataObject.stringValue);
        [[UIApplication   sharedApplication] openURL:[NSURL URLWithString:metadataObject.stringValue]];
    }
}

@end
