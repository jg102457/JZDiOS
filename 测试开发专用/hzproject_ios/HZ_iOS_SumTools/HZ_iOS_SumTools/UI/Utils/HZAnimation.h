//
//  MyAnimation.h
//  HZHousingSalesProject
//
//  Created by ShangchaoGao on 14-2-14.
//  Copyright (c) 2014年 ShangchaoGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HZAnimation : NSObject
// 视图抖动动画
+ (void)shakeView:(UIView *)view duration:(CGFloat)fDuration;
// 心跳动画
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration;
// 对指定视图进行截图
+ (UIImage *)screenShotView:(UIView *)view;
//弹出动画，类似于苹果弹出视图
+(void)popViewAnimation:(UIView *)view;
+(void)popViewAnimation:(UIView *)view Duration:(float) duration;
//永久闪烁的动画
+(void)opacityForeverAnimation:(float)time toView:(UIView *)toView;
//渐隐效果的动画
+(void)opacityAnimation:(float)time toView:(UIView *)toView;
//旋转动画
+(void)rotationAnimation:(float)time XYZ_Axis:(NSString *)axis toView:(UIView *)toView;
//跳动效果
+(void)hotSpotX:(float)x hotSpotY:(float)y imageName:(NSString *)imageName  toView:(UIView *)toView;


//淡入淡出的动画
+(void)fadeAnimation:(float)durationTime toView:(UIView *)toView;
//阿拉伯神灯吸入的动画
+(void)suckEffectAnimation:(float)durationTime toView:(UIView *)toView;
//立方体切换的动画
+(void)cubeAnimation:(float)durationTime toView:(UIView *)toView;
//上下翻转的动画
+(void)oglFlipAnimation:(float)durationTime toView:(UIView *)toView;
//水纹的动画
+(void)rippleEffectAnimation:(float)durationTime toView:(UIView *)toView;
//移除的动画
+(void)revealAnimation:(float)durationTime toView:(UIView *)toView;
//push动画
+(void)pushAnimationWithSubType:(NSString *)subType toView:(UIView *)toView;



#pragma mark - Custom Animation
// reveal
+ (void)animationRevealFromBottom:(UIView *)view;
+ (void)animationRevealFromTop:(UIView *)view;
+ (void)animationRevealFromLeft:(UIView *)view;
+ (void)animationRevealFromRight:(UIView *)view;

// 渐隐渐消
+ (void)animationEaseIn:(UIView *)view;
+ (void)animationEaseOut:(UIView *)view;

// 翻转
+ (void)animationFlipFromLeft:(UIView *)view;
+ (void)animationFlipFromRigh:(UIView *)view;

// 翻页
+ (void)animationCurlUp:(UIView *)view;
+ (void)animationCurlDown:(UIView *)view;

// push
+ (void)animationPushUp:(UIView *)view;
+ (void)animationPushDown:(UIView *)view;
+ (void)animationPushLeft:(UIView *)view;
+ (void)animationPushRight:(UIView *)view;

// move
+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIView *)view;
+ (void)animationMoveRight:(UIView *)view;

// 各种旋转缩放效果
+(void)animationRotateAndScaleEffects:(UIView *)view DurationTime:(float) duration;

// 旋转同时缩小放大效果
+ (void)animationRotateAndScaleDownUpWithDuration:(CGFloat)time forView:(UIView *)view;


#pragma mark - Private API

/**
 *  下面动画里用到的某些属性在当前API里是不合法的,但是也可以用.
 */

+ (void)animationFlipFromTop:(UIView *)view;
+ (void)animationFlipFromBottom:(UIView *)view;

+ (void)animationCubeFromLeft:(UIView *)view;
+ (void)animationCubeFromRight:(UIView *)view;
+ (void)animationCubeFromTop:(UIView *)view;
+ (void)animationCubeFromBottom:(UIView *)view;

+ (void)animationSuckEffect:(UIView *)view;

+ (void)animationRippleEffect:(UIView *)view;

+ (void)animationCameraOpen:(UIView *)view;
+ (void)animationCameraClose:(UIView *)view;

@end

