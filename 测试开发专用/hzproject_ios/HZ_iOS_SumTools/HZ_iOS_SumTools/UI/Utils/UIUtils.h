//
//  UIUtils.h
//  WXTime
//
//  Created by ShangchaoGao on 12-7-22.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h> // 判断设备型号
#import <UIKit/UIKit.h>

@interface UIUtils : NSObject
@property(nonatomic,assign) int secondsCountDown; //倒计时总时长
@property(nonatomic,strong)   NSTimer *countDownTimer;
 @property(nonatomic,strong) UIButton *sendMessageBtn;
//获取documents下的文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName;
 // 判断设备型号
+(NSString *)machineOfDevice;


/*****日期方法*****start********/
// date 格式化为 string
+ (NSString*) stringFromDate:(NSDate*)date formate:(NSString*)formate;
// string 格式化为 date
+ (NSDate *) dateFromString:(NSString *)datestring formate:(NSString*)formate;
// 时间格式转换
+ (NSString *)formateString:(NSString *)datestring;
//获取当前日期
+(NSDate *)getNowDate;
//时间戳格式转换-设置成转换的展示样式
+ (NSString *)dateChangeToStr:(NSInteger)date andFormatter:(NSDateFormatter *)formatte;
//格式转成时间戳-设置成时间戳上传服务器
+ (NSString *)strChangeToDate:(NSDate  *)date;
//计算与当前时间的相差
+ (NSString *)distanceToCurrentTime:(NSString *)preTime;
//计算之前日期与当前日期的相差天数
+(int)distanceToCurrentDay:(NSString *)preDay;

//截取日期 2011-1-20 0:00:00   ----->2011-1-20
+ (NSString *)getDateFromString:(NSString *)dateStr;
#pragma mark 计算某一天是该年的第几周
+ (NSString *)getWeekOfYear:(NSDate *)date;

// 比较两个日期
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
// 计算某一天是周几
+ (int)getWeekFromDate:(NSDate *)date;
/*****日期方法*****end********/

//创建带图片的按钮
+ (UIButton*) createButtonWithFrame: (CGRect) frame Target:(id)target Selector:(SEL)selector ImageName:(NSString *)imageName;
//创建带标题的按钮
+ (UIButton *) createButtonWithFrame:(CGRect)frame Title:(NSString *)title backgroundImage:(NSString *)imageName Target:(id)target Selector:(SEL)selector;
//创建UIPageControl
+(UIPageControl *)createPageControlWithFrame:(CGRect)frame numberOfPages:(NSInteger)numberOfPages currentPage:(NSInteger)currentPage Target:(id)target Selector:(SEL)selector;
//创建UIScrollView
+(UIScrollView *)createScrollViewWithFrame:(CGRect)frame  delegateTarget:(id)target;
//创建UIImageView
+(UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;
//创建一个内容可拉伸，而边角不拉伸的图片视图
+ (UIImageView *)createStretchableImageViewWithLeftCapWidth:(NSInteger)left topCapHeight:(NSInteger)top imageNamed:(NSString *)imageName;
//创建一个内容可拉伸，而边角不拉伸的图片
+ (UIImage *)createStretchableImageWithLeftCapWidth:(NSInteger)left topCapHeight:(NSInteger)top imageNamed:(NSString *)imageName;
//创建UIImage
+(UIImage *)createImageWithImageName:(NSString *)imageName;
//创建UILabel
+(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text  fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor;
//创建UITextView
+(UITextView *)createTextViewWithFrame:(CGRect)frame text:(NSString *)text  fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor;
//创建跑马灯label
+ (UILabel *)createMarqueeLabelWithFrame:(CGRect)frameForLabel textStr:(NSString *)text;
//GIF图片解析
+ (NSMutableArray *)praseGIFDataToImageArray:(NSData *)data;

//给UIView添加边框
+ (void)addBordersForView:(UIView *)view;

// 添加layer及其“倒影”
+ (void)showImageAndReflection:(CALayer*)layer;
// 设置背景色
+ (void)colorWithPatternImageName:(NSString *)imageName toView:(UIView *)view;

//文字编码----从 GBK 转到 UTF-8
+(NSString *)GBK_To_UTF8_withDdata:(NSData *)data;

#pragma mark -判断网络设置是否有异常
+ (BOOL)isConnectionAvailable;

//获取字典里的指定数值
+ (NSString *)getValueFromDictionary:(NSDictionary *)dataDic ForKey:(NSString *)key;

//创建导航栏的自定义返回视图
+ (void)createLeftBarButtonItemWithTarget:(id)target Selector:(SEL)selector;
//创建导航栏的自定义右侧视图
+ (void)createRightBarButtonItemWithTarget:(id)target Selector:(SEL)selector imageName:(NSString *)imageName;



//自定义导航栏
+ (void)createNavigationViewWithTitile:(NSString *)title  BackgroundImageName:(NSString *)bgImgName GoBackButtonWithImageName:(NSString *)goBackImgName  GoBackTarget:(id)target Selector:(SEL)selector ToView:(UIView *)view;

//添加倒影
+ (void) addSimpleReflectionToView: (UIView *) theView Distance:(float)distance Opacity:(float)opacity ReflectPercent:(float)reflectPercent;

//提醒信息(在屏幕底部显示三秒后自动消失)
+ (void)addRemindInformationWithText:(NSString *)text FontSize:(float)fontSize  ToView:(UIView *)toView;
+ (void)removeRemindLabelFromView:(UIView *)superView;

//将字典转换为json字符串
+ (NSString *)JSONString:(NSDictionary *)dataDic;

// UIView转换为UIImage
+ (UIImage*) imageWithUIView:(UIView*) view  Scale: (CGFloat) scale;


//利用正则表达式验证邮箱是否合法
+(BOOL)isValidateEmail:(NSString *)email;

//将字典里的null 转换为空字符
+ (NSDictionary *)getValueFromDictionary:(NSDictionary *)dic;



#pragma mark - 抖动动画 （密码输入错误时的提示）
+ (void)addShakeAnimationForView:(UIView *)view withDuration:(NSTimeInterval)duration;
//根据颜色 返回图片
+(UIImage*) imageWithColor:(UIColor*)color;
//颜色的渐变
+ (void) colorChangedWithView:(UIView *)view andImage:(UIImageView *)imageView;
//获取当前日期的上一个月
+ (NSDate *)getLastMonth;
- (void)getLastMonth;

//根据图片名字,获取本地图片
+(UIImage *)getImageWithName:(NSString *)name andType:(NSString *)type;
/*开启键盘管理工具*/
+ (void)openKeyboardManger;
/*
 des 加密和解密
 */
+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key;
/*
 发送验证码
 */
- (void)addSendMessageButton:(UIButton *)btn;

//将字符串数组按照元素首字母顺序进行排序分组
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;
+ (NSString *)getDeviceIPIpAddresses;
//

//等比缩放
+ (UIImage*)scaleToSize:(CGSize)size andImage:(UIImage *)selfImage;
//指定缩放
+ (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size;

//截取指定区域图
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)frame;
//正则验证手机号
+ (BOOL)validateMobile:(NSString *)mobile;
//正则邮箱验证
+ (BOOL) IsEmailAdress:(NSString *)Email;
@end
