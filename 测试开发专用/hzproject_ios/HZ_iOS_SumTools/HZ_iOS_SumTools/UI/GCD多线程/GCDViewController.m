//
//  GCDViewController.m
//  Big_WHEEL
//
//  Created by jason on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
/*

 GCD 异步 多线程  下载示例~~~~~~~~~creat by 2016/8/28
 
 */

#import "GCDViewController.h"
@interface GCDViewController ()

@end

@implementation GCDViewController
{
    
    UIImageView *_imageView;
    
}
- ( void )viewDidLoad

{
    
    [ super viewDidLoad ];
    
    self . title = @"GCD" ;
    
    //初始化一_ImageView
    
    _imageView =[[ UIImageView alloc ] initWithFrame : CGRectMake ( 10 , 70 , 300 , 450 )];
    
    _imageView . backgroundColor =[ UIColor grayColor ];
    
    _imageView . animationDuration = 3.0 ;
    
    _imageView . animationRepeatCount = 0 ;
    
    //
    [ self . view addSubview : _imageView ];
    
    //在后台异步执行队列

    dispatch_async ( dispatch_get_global_queue ( DISPATCH_QUEUE_PRIORITY_DEFAULT , 0 ), ^{
        
        NSString *url1= @"http://h.hiphotos.baidu.com/image/w%3D230/sign=b2d5c289123853438ccf8022a311b01f/91ef76c6a7efce1b1ae9f92fad51f3deb58f6510.jpg" ;
        
        NSString *url2= @"http://h.hiphotos.baidu.com/image/pic/item/d058ccbf6c81800aae834e8bb33533fa838b47d5.jpg" ;
        
        NSString *url3= @"http://d.hiphotos.baidu.com/image/pic/item/f2deb48f8c5494eec3ba65132ff5e0fe99257e1b.jpg" ;
        
        NSString *url4= @"http://g.hiphotos.baidu.com/image/pic/item/a6efce1b9d16fdfa81f4ace4b68f8c5494ee7b1b.jpg" ;
        
        NSString *url5= @"http://g.hiphotos.baidu.com/image/pic/item/d6ca7bcb0a46f21f70031fdbf4246b600c33ae07.jpg" ;
        
        NSArray *array=[[ NSArray alloc ] initWithObjects :url1,url2,url3,url4,url5, nil ];
        
        NSMutableArray *imageArray=[[ NSMutableArray alloc ] initWithCapacity : 20 ];
        
        for ( NSString *string in array) {
            
            //下载图片
            
            NSLog ( @"执行图片下载函数" );
            
            NSData *data = [ NSData dataWithContentsOfURL :[ NSURL URLWithString :string]];
            
            UIImage *image = [ UIImage imageWithData :data];
            
            [imageArray addObject :image];
            
        }
        
        _imageView . animationImages =imageArray;
        _imageView.animationDuration = 20;
        
        //回到主线程执行方法
        
        
        dispatch_async ( dispatch_get_main_queue (), ^{
            
            [ _imageView startAnimating ];
            
        });
    });
    //[ _imageView startAnimating ];
}
////线程运行方式

//dispatch_async 异步执行
//
//dispatch_sync  同步执行
//
//dispatch_delay 延迟执行
@end