//
//  ViewController.h
//  hcdCachePlayerDemo
//
//  Created by polesapp-hcd on 16/7/1.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "HcdCachePlayer.h"
@interface VideoDetailController : RootViewController

@property (nonatomic, copy) NSString *videoUrlStr;
@property (nonatomic,retain)  MPMoviePlayerController *moviePlayer;
@end

