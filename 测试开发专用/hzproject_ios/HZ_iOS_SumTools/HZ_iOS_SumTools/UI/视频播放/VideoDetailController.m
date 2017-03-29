//
//  ViewController.m
//  hcdCachePlayerDemo
//
//  Created by polesapp-hcd on 16/7/1.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import "VideoDetailController.h"



@interface VideoDetailController ()
{
    HcdCacheVideoPlayer *_play;
    HcdCacheVideoPlayer *_play2;
    MPMoviePlayerController *moviePlayer;
}

@end

@implementation VideoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"hcdCachePlayerDemo";
    // Do any additional setup after loading the view, typically from a nib.
    
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://baobab.wdjcdn.com/14564977406580.mp4"]];
   moviePlayer.movieSourceType=MPMovieSourceTypeStreaming;//网络文件要设置为stream
    [moviePlayer play];
       moviePlayer.view.frame= CGRectMake(0, 0, 300, 300);
    [self.view addSubview:moviePlayer.view];
    
//    _play = [[HcdCacheVideoPlayer alloc]init];
//    UIView *videoView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.5625)];
//    [self.view addSubview:videoView];
//    
//    [_play playWithUrl:[NSURL URLWithString:self.videoUrlStr]
//              showView:videoView
//          andSuperView:self.view
//             withCache:YES];
//    
    NSLog(@"%f", [HcdCacheVideoPlayer allVideoCacheSize]);
    
    
//    _play2 = [[HcdCacheVideoPlayer alloc]init];
//    UIView *videoView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 350, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.5625)];
//    [self.view addSubview:videoView2];
//    
//    [_play2 playWithUrl:[NSURL URLWithString:self.videoUrlStr]
//              showView:videoView2
//          andSuperView:self.view
//             withCache:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_play stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
