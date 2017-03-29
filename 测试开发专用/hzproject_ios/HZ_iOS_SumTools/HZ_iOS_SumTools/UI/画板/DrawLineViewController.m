//
//  DrawLineViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "DrawLineViewController.h"
#import "DrawLineView.h"
#import "BlocksKit+UIKit.h"
#import "TZImagePickerController.h"
@interface DrawLineViewController ()<TZImagePickerControllerDelegate>
@property (nonatomic,strong) NSMutableArray *beziPathArrM;
@end

@implementation DrawLineViewController{
    DrawLineView *VC;
    UIView *neW;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     VC = [[DrawLineView alloc]initWithFrame:self.view.frame];
   // VC.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:VC];
  


    UIButton *btn = [Tools initWithFrame:CGRectMake(100, 200, 0, 0) ButtonWithText:@"添加图片" andfont:[UIFont systemFontOfSize:15]];
    [btn bk_addEventHandler:^(id sender) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        
        // You can get the photos by block, the same as by delegate.
        // 你可以通过block或者代理，来得到用户选择的照片.
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray *photos, NSArray *assets) {
           VC.backgroundColor = [UIColor colorWithPatternImage:[UIUtils imageCompressWithSimple:photos[0] scaledToSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)]];
            
            
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
  
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];



    
    UIButton *btn2 = [Tools initWithFrame:CGRectMake(200, 400, 0, 0) ButtonWithText:@"截图呆呼呼的和" andfont:[UIFont systemFontOfSize:15]];
    [btn2 bk_addEventHandler:^(id sender) {
    UIImage *img =   [self imageFromView:self.view atFrame:self.view.frame];
     
        [VC removeFromSuperview];
        
        
        UIImageView *view =[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        view.image = img;
        [self.view addSubview:view];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
}

- (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}

@end
