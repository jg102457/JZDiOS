//
//  UIUtils.m
//  WXTime
//
//  Created by ShangchaoGao on 12-7-22.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#import "UIUtils.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Reachability.h"
#import "HZAnimation.h"
#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import <sys/socket.h>

#import <sys/sockio.h>

#import <sys/ioctl.h>

#import <net/if.h>

#import <arpa/inet.h>
//获取设备的物理高度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//获取设备的物理宽度
#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
//颜色设置
#define Color(R,G,B)  [UIColor colorWithRed:R/255.00 green:G/255.00 blue:B/255.00 alpha:1.0f]

@implementation UIUtils{

   
}

//获取文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *path = [documents stringByAppendingPathComponent:fileName];
    return path;
}

// 判断设备型号
+(NSString *)machineOfDevice
{
    struct utsname u;
    uname(&u);
    NSString *machine = [NSString stringWithCString:u.machine encoding:NSUTF8StringEncoding];
    return machine;
}

// date 格式化为 string
+ (NSString*)stringFromDate:(NSDate*)date formate:(NSString*)formate {
	NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:formate];
	NSString *str = [formatter stringFromDate:date];
	return str;
}

// string 格式化为 date
+ (NSDate *)dateFromString:(NSString *)datestring formate:(NSString*)formate {
	NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}
+ (NSString *)dateChangeToStr:(NSInteger)date andFormatter:(NSDateFormatter *)formatter{

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:date];

    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;

    
}
+ (NSString *)strChangeToDate:(NSDate *)date{


 NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}
// 时间格式转换
+ (NSString *)formateString:(NSString *)datestring{
    NSString *formate = @"E MMM d HH:mm:ss Z yyyy";
    NSDate *createDate = [UIUtils dateFromString:datestring formate:formate];
    NSString *text = [UIUtils stringFromDate:createDate formate:@"MM-dd HH:mm"];
    return text;
}

//截取日期 2011-1-20 0:00:00   ----->2011-1-20
+ (NSString *)getDateFromString:(NSString *)dateStr
{
    NSArray *array = [dateStr componentsSeparatedByString:@" "];
    NSString *date = [array objectAtIndex:0];
    return date;
}

//计算与当前时间的相差
+ (NSString *)distanceToCurrentTime:(NSString *)preTime
{
    //将传入时间转化成需要的格式
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:preTime];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    //获取当前时间
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    
    long lTime = (long)intervalTime;
    NSInteger iSeconds = lTime % 60;
    NSInteger iMinutes = (lTime / 60) % 60;
    NSInteger iHours = (lTime / 3600);
    NSInteger iDays = lTime/60/60/24;
    NSInteger iMonth = lTime/60/60/24/12;
    NSInteger iYears = lTime/60/60/24/384;
    NSString *distanceStr = [NSString stringWithFormat:@"相差%d年%d月 或者 %d日%d时%d分%d秒", iYears,iMonth,iDays,iHours,iMinutes,iSeconds];
    NSLog(@"distanceStr = %@",distanceStr);
    return [NSString stringWithFormat:@"%d",iMinutes];
}
+ (NSDate *)getNowDate{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return date;
}
//计算之前日期与当前日期的相差天数
+(int)distanceToCurrentDay:(NSString *)preDay
{
    //将传入时间转化成需要的格式
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromdate=[format dateFromString:preDay];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    //获取当前时间
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    long lTime = (long)intervalTime;
    int iDays = lTime/60/60/24;
    return iDays;
}

//创建带图片的按钮
+ (UIButton*) createButtonWithFrame: (CGRect) frame Target:(id)target Selector:(SEL)selector ImageName:(NSString *)imageName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    UIImage *newImage = [self createImageWithImageName:imageName];
    [button setImage:newImage forState:0];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//创建带标题的按钮
+ (UIButton *) createButtonWithFrame:(CGRect)frame Title:(NSString *)title backgroundImage:(NSString *)imageName Target:(id)target Selector:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:0];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//创建UIPageControl
+(UIPageControl *)createPageControlWithFrame:(CGRect)frame numberOfPages:(NSInteger)numberOfPages currentPage:(NSInteger)currentPage Target:(id)target Selector:(SEL)selector
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = frame;
    pageControl.numberOfPages = numberOfPages;
    pageControl.currentPage = currentPage;
    [pageControl addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    return [pageControl autorelease];
}
//创建UIScrollView
+(UIScrollView *)createScrollViewWithFrame:(CGRect)frame  delegateTarget:(id)target
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = target;
    scrollView.backgroundColor = [UIColor whiteColor];
    return [scrollView autorelease];
}
//创建UIImageView
+(UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    imageView.backgroundColor = [UIColor clearColor];
    return [imageView autorelease];
}
//创建UIImage
+(UIImage *)createImageWithImageName:(NSString *)imageName
{
    NSString *pathFile = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:pathFile];
    return image;
}

//创建UILabel
+(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text  fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat w = frame.size.width;
    CGFloat h = frame.size.height;
    [label setNumberOfLines:0];
    CGSize size = CGSizeMake(w,h);
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize labelsize = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:font} context:nil].size;//方法更新
    //[text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    [label setFrame:CGRectMake(x, y, labelsize.width, labelsize.height)];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    if (textColor != nil) {
        label.textColor = textColor;
    }
    label.backgroundColor = [UIColor clearColor];

    return [label autorelease];
}

//创建UITextView
+(UITextView *)createTextViewWithFrame:(CGRect)frame text:(NSString *)text  fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = [UIColor clearColor];
    textView.editable = NO;
    //创建设置数组
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing = 5.0f;//设置文本行间距
    paragraph.paragraphSpacing = 5.0;//设置文本段间距
    //创建AttributeString
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraph, NSFontAttributeName:[UIFont systemFontOfSize:fontSize] , NSKernAttributeName: @(2.0),NSForegroundColorAttributeName: textColor};
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    [textView setAttributedText:attributedString];
    CGSize textViewSize =  [attributedString boundingRectWithSize:CGSizeMake(frame.size.width, frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    textView.contentSize = CGSizeMake(textViewSize.width, textViewSize.height);
    return [textView autorelease];
}


//创建跑马灯label
+ (UILabel *)createMarqueeLabelWithFrame:(CGRect)frameForLabel textStr:(NSString *)text
{
    UILabel *labelShow = [[UILabel alloc] initWithFrame:frameForLabel];
    labelShow.backgroundColor = [UIColor  clearColor];
    labelShow.textColor = Color(140, 140, 140);
    labelShow.font = [UIFont systemFontOfSize:14];
    [labelShow sizeToFit];
    labelShow.text = text;
    CGRect frame = labelShow.frame;
    CGSize dims = [labelShow.text sizeWithFont:labelShow.font];
    frame.origin.x = dims.width >320 ? dims.width:320;      //设置起点
    [labelShow setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, frame.origin.y, dims.width, dims.height)];
    [UIView beginAnimations:@"MarqueeAnimation" context:NULL];
    [UIView setAnimationDuration:10.0f];     //动画执行时间
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999]; // 动画执行次数
    frame = labelShow.frame;
    frame.origin.x = -dims.width;   //设置终点
    labelShow.frame = frame;
    [UIView commitAnimations];
    return [labelShow autorelease];
}


//GIF图片解析
+ (NSMutableArray *)praseGIFDataToImageArray:(NSData *)data
{
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    CGFloat animationTime = 0.f;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        frames = [NSMutableArray arrayWithCapacity:l];
        for (size_t i = 0; i < l; i++) {
            CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
            NSDictionary *properties = (NSDictionary *)CGImageSourceCopyPropertiesAtIndex(src, i, NULL);
            NSDictionary *frameProperties = [properties objectForKey:(NSString *)kCGImagePropertyGIFDictionary];
            NSNumber *delayTime = [frameProperties objectForKey:(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
            animationTime += [delayTime floatValue];
            if (img) {
                [frames addObject:[UIImage imageWithCGImage:img]];
                CGImageRelease(img);
            }
        }
    }
    return [frames autorelease];;
}


//给UIView添加边框
+ (void)addBordersForView:(UIView *)view
{
    view.layer.masksToBounds=YES;
    view.layer.cornerRadius=5.0;
    view.layer.masksToBounds = YES;
    view.layer.borderWidth=1.0;
    view.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    return;
}


// 添加layer及其“倒影”
+ (void)showImageAndReflection:(CALayer*)layer
{
    // 制作reflection
    CALayer *reflectLayer = [CALayer layer];
    reflectLayer.contents = layer.contents;
    reflectLayer.bounds = layer.bounds;
    reflectLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height*1.5);
    reflectLayer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    // 给该reflection加个半透明的layer
    CALayer *blackLayer = [CALayer layer];
    blackLayer.backgroundColor = [UIColor blackColor].CGColor;
    blackLayer.bounds = reflectLayer.bounds;
    blackLayer.position = CGPointMake(blackLayer.bounds.size.width/2, blackLayer.bounds.size.height/2);
    blackLayer.opacity = 0.6;
    [reflectLayer addSublayer:blackLayer];
    
    // 给该reflection加个mask
    CAGradientLayer *mask = [CAGradientLayer layer];
    mask.bounds = reflectLayer.bounds;
    mask.position = CGPointMake(mask.bounds.size.width/2, mask.bounds.size.height/2);
    mask.colors = [NSArray arrayWithObjects:
                   (__bridge id)[UIColor clearColor].CGColor,
                   (__bridge id)[UIColor whiteColor].CGColor, nil];
    mask.startPoint = CGPointMake(0.5, 0.35);
    mask.endPoint = CGPointMake(0.5, 1.0);
    reflectLayer.mask = mask;
    
    // 作为layer的sublayer
    [layer addSublayer:reflectLayer];
}

//创建一个内容可拉伸，而边角不拉伸的图片视图
+ (UIImageView *)createStretchableImageViewWithLeftCapWidth:(NSInteger)left topCapHeight:(NSInteger)top imageNamed:(NSString *)imageName
{
    UIImage *image_pre = [UIUtils createImageWithImageName:imageName];
    UIImage *image_now = [image_pre stretchableImageWithLeftCapWidth:left topCapHeight:top];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image_now];
    return imageView;
}
//创建一个内容可拉伸，而边角不拉伸的图片
+ (UIImage *)createStretchableImageWithLeftCapWidth:(NSInteger)left topCapHeight:(NSInteger)top imageNamed:(NSString *)imageName
{
    UIImage *image_pre = [UIUtils createImageWithImageName:imageName];
    UIImage *image_now = [image_pre stretchableImageWithLeftCapWidth:left topCapHeight:top];
    return image_now;
}
// 设置背景色
+ (void)colorWithPatternImageName:(NSString *)imageName toView:(UIView *)view
{
    UIImage *image = [UIUtils createImageWithImageName:imageName];
    view.layer.contents = (id)image.CGImage;
}

//文字编码----从 GBK 转到 UTF-8
+(NSString *)GBK_To_UTF8_withDdata:(NSData *)data
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *str = [[NSString alloc] initWithData:data encoding:enc];
    return str;
}

#pragma mark -判断网络设置是否有异常
+ (BOOL)isConnectionAvailable {
    BOOL isExistenceNetWork = YES;
    Reachability * reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable://网络连接失败
            isExistenceNetWork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetWork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetWork = YES;
            break;
    }
    if (!isExistenceNetWork) {
     //   UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无法连接网络" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
       // [alert show];
    }
    return isExistenceNetWork;
}

//获取字典里的指定数值
+ (NSString *)getValueFromDictionary:(NSDictionary *)dataDic ForKey:(NSString *)key
{
    
    if ([dataDic objectForKey:key] == nil) {
        NSLog(@"请输入正确的key值");
        return @"";
    }
    NSString *str = [dataDic objectForKey:key];
    if (str.length == 0) {
        str = @"";
    }
    return str;
}

//创建导航栏的自定义返回视图
+ (void)createLeftBarButtonItemWithTarget:(id)target Selector:(SEL)selector
{
    UIViewController *vc = (UIViewController *)target;
    UIButton *backButton = [UIUtils createButtonWithFrame:CGRectMake(0, 0, 44, 44) Target:target Selector:selector ImageName:@"icon1_01.png" ImagePressed:nil];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    vc.navigationItem.leftBarButtonItem = leftItem;
}

//创建导航栏的自定义右侧视图
+ (void)createRightBarButtonItemWithTarget:(id)target Selector:(SEL)selector imageName:(NSString *)imageName
{
    UIViewController *vc = (UIViewController *)target;
    UIButton *rightButton = [UIUtils createButtonWithFrame:CGRectMake(0, 0, 44, 44) Target:target Selector:selector ImageName:imageName ImagePressed:nil];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    vc.navigationItem.rightBarButtonItem = rightItem;
}

//自定义导航栏
+ (void)createNavigationViewWithTitile:(NSString *)title  BackgroundImageName:(NSString *)bgImgName GoBackButtonWithImageName:(NSString *)goBackImgName  GoBackTarget:(id)target Selector:(SEL)selector ToView:(UIView *)view
{
    UIView *naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    naviView.backgroundColor = [UIColor clearColor];
    [view addSubview:naviView];
    UIImageView *bgImageView  = [UIUtils createImageViewWithFrame:CGRectMake(0, 0, ScreenWidth, 44) imageName:bgImgName];
    [naviView addSubview:bgImageView];
    UIButton *goBackButton = [UIUtils createButtonWithFrame:CGRectMake(0,0, 44, 44) Target:target Selector:selector ImageName:goBackImgName ImagePressed:nil];
    [naviView addSubview:goBackButton];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 0, ScreenWidth-88, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    if (title) titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [naviView addSubview:titleLabel];
}

/*
 distance：和原图之间的距离； opacity：阴影图片的透明度；reflectPercent：倒影的百分比大小
 */
#pragma mark 添加倒影
+ (void) addSimpleReflectionToView: (UIView *) theView Distance:(float)distance Opacity:(float)opacity ReflectPercent:(float)reflectPercent
{
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.contents = [theView layer].contents;
    reflectionLayer.opacity = opacity;
    reflectionLayer.frame = CGRectMake(0.0f, 0.0f,
                                       theView.frame.size.width,
                                       theView.frame.size.height * reflectPercent);
    CATransform3D stransform = CATransform3DMakeScale(1.0f, -1.0f, 1.0f);
    CATransform3D transform = CATransform3DTranslate(stransform, 0.0f,
                                                     -(distance + theView.frame.size.height), 0.0f);
    reflectionLayer.transform = transform;
    reflectionLayer.sublayerTransform = reflectionLayer.transform;
    [[theView layer] addSublayer:reflectionLayer];
}

/*
 frameSize：文本信息的宽度和高度，建议设置大一些； text：文本信息；FontSize：字号大小；toView：添加到该视图
 */
#pragma mark -提醒信息
+ (void)addRemindInformationWithText:(NSString *)text FontSize:(float)fontSize  ToView:(UIView *)toView
{
    UILabel *remindLabel = (UILabel *)[toView viewWithTag:5555];
    if (!remindLabel) {
        remindLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        remindLabel.tag = 5555;
        remindLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [remindLabel setNumberOfLines:0];
        CGSize size = CGSizeMake(ScreenWidth,40);
        UIFont *font = [UIFont systemFontOfSize:fontSize];
        NSString *remindStr = [NSString stringWithFormat:@"   %@",text];
        CGSize labelsize = [remindStr sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        [remindLabel setFrame:CGRectMake(0, 5, labelsize.width+10, labelsize.height+10)];
        remindLabel.center = CGPointMake(toView.frame.size.width/2, toView.frame.size.height-labelsize.height-80);
        remindLabel.layer.cornerRadius = 2.0f;
        remindLabel.layer.masksToBounds = YES;
        remindLabel.text = remindStr;
        remindLabel.textColor = [UIColor whiteColor];
        remindLabel.font = [UIFont systemFontOfSize:fontSize];
        [toView addSubview:remindLabel];
        [toView bringSubviewToFront:remindLabel];
        [HZAnimation  popViewAnimation:remindLabel];
        RunBlockAfterDelay(2.0, ^{   //3秒后删除提醒信息
            [UIUtils removeRemindLabelFromView:toView];
        });
    }
}

void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void))
{ //使用GCD延迟执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
                           dispatch_get_current_queue(), block);
}
+ (void)removeRemindLabelFromView:(UIView *)superView
{
    UILabel *remindLabel = (UILabel *)[superView viewWithTag:5555];
    if (remindLabel) {
        [remindLabel removeFromSuperview];
    }
}

#pragma mark  将字典转换为json字符串
+ (NSString *)JSONString:(NSDictionary *)dataDic
{
    NSMutableString *jsonString = [[NSMutableString alloc] init];
    NSArray *keyArray = [dataDic allKeys];
    NSArray *valueArray = [dataDic allValues];
    for (int i = 0; i < keyArray.count; i ++) {
        NSString *key = [keyArray objectAtIndex:i];
        NSString *value = [valueArray objectAtIndex:i];
        value = [value stringByReplacingOccurrencesOfString:@"\'" withString:@"\\\'"];
        value = [value stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];

        NSString *str = [NSString stringWithFormat:@"\'%@\':\'%@\'",key,value];
        if ( ! (i == keyArray.count-1)) {
            [jsonString appendFormat:@"%@,",str];
        } else [jsonString appendFormat:@"%@",str];
    }
    
    return [NSString stringWithFormat:@"{%@}",jsonString];
}

#pragma mark UIView转换为UIImage
+ (UIImage*) imageWithUIView:(UIView*) view  Scale: (CGFloat) scale{
    // 创建一个bitmap的context，并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    //[view.layer drawInContext:currnetContext];
    [view.layer renderInContext:currnetContext];
    // 从当前context中创建一个改变大小后的图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark 比较两个日期
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        return 1;
    }
    else if (result == NSOrderedAscending){
        return -1;
    }
    return 0;
}

//利用正则表达式验证
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark 将字典里的null 转换为空字符
+ (NSDictionary *)getValueFromDictionary:(NSDictionary *)dic
{
    NSMutableDictionary *valueDic = [[NSMutableDictionary alloc] init];
    NSArray *keyArray = [dic allKeys];
    NSMutableArray *valueS = [[NSMutableArray alloc] init];
    for (int i = 0; i < keyArray.count; i ++) {
        NSString *key = [keyArray objectAtIndex:i];
        NSString *value = [NSString stringWithFormat:@"%@",[dic objectForKey:key]];
        if ([value isEqualToString:@"null"] ||  [value isEqualToString:@"<null>"] || [value isEqualToString:@"(null)"]) {
            value = @"";
        }
        [valueS addObject:value];
        [valueDic setObject:value forKey:key];
    }
    return valueDic;
}


#pragma mark 计算某一天是该年的第几周
+ (NSString *)getWeekOfYear:(NSDate *)date
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = [gregorianCalendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear|NSCalendarUnitYearForWeekOfYear) fromDate:date];
    NSInteger unitYearForWeekOfYear = [weekdayComponents yearForWeekOfYear];
    NSInteger weekOfYear = [weekdayComponents weekOfYear];
    NSString *infoStr = [NSString stringWithFormat:@"%d年第%d周",unitYearForWeekOfYear,weekOfYear];
    return infoStr;
}

// 计算某一天是周几
+ (int)getWeekFromDate:(NSDate *)date
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = [gregorianCalendar components:(NSWeekdayCalendarUnit) fromDate:date];
    int weekday = [weekdayComponents weekday];
    return weekday;
}

#pragma mark - 抖动动画 （密码输入错误时的提示）
+ (void)addShakeAnimationForView:(UIView *)view withDuration:(NSTimeInterval)duration {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat currentTx = view.transform.tx;
    
    animation.delegate = self;
    animation.duration = duration;
    animation.values = @[ @(currentTx), @(currentTx + 10), @(currentTx-8), @(currentTx + 8), @(currentTx -5), @(currentTx + 5), @(currentTx) ];
    animation.keyTimes = @[ @(0), @(0.225), @(0.425), @(0.6), @(0.75), @(0.875), @(1) ];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:@"ShakeAnimation"];
}
+(UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//+(UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSize textColor:(UIColor *)textColor
//{
//    //去掉空行
//    NSString *myString = [text stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
//    //创建设置数组
//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    paragraph.alignment = self.textAlignment ; //文本对齐
//    paragraph.lineSpacing = self.linesSpacing;//设置文本行间距
//    paragraph.paragraphSpacing = 5.0;//设置文本段间距
//    //创建AttributeString
//    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont fontWithName:self.font.fontName size:self.font.pointSize] , NSKernAttributeName: @(self.characterSpacing),NSForegroundColorAttributeName: self.textColor,NSParagraphStyleAttributeName:paragraph};
//    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithString:myString attributes:attributes];
//    [self setAttributedText:attributedString];
//    [self setNumberOfLines:0];
//    CGSize labelSize =[self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
//    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width, labelSize.height)];
//    NSLog(@"requestedRect.size.height = %f",requestedRect.size.height);
//
//}

+ (void) colorChangedWithView:(UIView *)view andImage:(UIImageView *)imageView{
    
    imageView.center = view.center;
    [view addSubview:imageView];
    //初始化渐变层
    CAGradientLayer *gradientLayer  = [CAGradientLayer layer];
    gradientLayer.frame = imageView.bounds;
    [imageView.layer addSublayer:gradientLayer];
    
    //设置渐变颜色方向
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设定颜色组
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor purpleColor].CGColor];
    
    //设定颜色分割点
    gradientLayer.locations = @[@(0.5f) ,@(1.0f)];

}
+ (NSDate *)getLastMonth{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = nil;
    NSDate *mydate = [NSDate date];
    comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:0];
    
    [adcomps setMonth:-1];
    
    [adcomps setDay:0];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSLog(@"%@",newdate);
    
    return newdate;
}
+(UIImage *)getImageWithName:(NSString *)name andType:(NSString *)type
{
    NSString *path;
    if(type!=nil){
        path=[[NSBundle mainBundle] pathForResource:name ofType:type];
    }else{
        path=[[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    }
    UIImage *image=[[UIImage alloc] initWithContentsOfFile:path];
    return image;
}

+ (void)openKeyboardManger{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    
    manager.enable = YES; // 控制整个功能是否启用。
    
    manager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    
    manager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    
    manager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    
    manager.toolbarManageBehaviour = IQAutoToolbarByTag; // 最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一
    
}
+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
    NSUInteger dataLength = [plainText length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        //系统自带
        ciphertext = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        //GTMbase64
//        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
    }
    return ciphertext;
}

//解密
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    //自带
    NSData* cipherData = [[NSData alloc] initWithBase64EncodedString:cipherText options:0];
    //GTmbase64
   // NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    }
    return plainText;
}
- (void)addSendMessageButton:(UIButton *)btn{
    _sendMessageBtn = btn;
    _secondsCountDown = 60;//60秒倒计时

    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
}
-(void)timeFireMethod{
    //倒计时-1
    _secondsCountDown--;
    //修改倒计时标签现实内容
    _sendMessageBtn.enabled = NO;
    [_sendMessageBtn  setTitle:[NSString stringWithFormat:@"%d s",_secondsCountDown] forState:UIControlStateNormal];
    
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(_secondsCountDown==0){
        [_countDownTimer invalidate];
        _sendMessageBtn.enabled = YES;
        
        [_sendMessageBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        
    }
}

//将字符串数组按照元素首字母顺序进行排序分组
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array{
    if (array.count == 0) {
        return nil;
    }
    for (id obj in array) {
        if (![obj isKindOfClass:[NSString class]]) {
            return nil;
        }
    }
    UILocalizedIndexedCollation *indexedCollation = [UILocalizedIndexedCollation currentCollation];
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:indexedCollation.sectionTitles.count];
    //创建27个分组数组
    for (int i = 0; i < indexedCollation.sectionTitles.count; i++) {
        NSMutableArray *obj = [NSMutableArray array];
        [objects addObject:obj];
    }
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:objects.count];
    //按字母顺序进行分组
    NSInteger lastIndex = -1;
    for (int i = 0; i < array.count; i++) {
        NSInteger index = [indexedCollation sectionForObject:array[i]collationStringSelector:@selector(uppercaseString)];
        [[objects objectAtIndex:index]addObject:array[i]];
        lastIndex = index;
    }
    //去掉空数组
    for (int i = 0; i < objects.count; i++) {
        NSMutableArray *obj = objects[i];
        if (obj.count == 0) {
            [objects removeObject:obj];
        }
    }
    //获取索引字母
    for (NSMutableArray *obj in objects) {
        NSString *str = obj[0];
        NSString *key = [self firstCharacterWithString:str];
        [keys addObject:key];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:objects forKey:keys];
    return dic;
}
//获取字符串(或汉字)首字母
+ (NSString *)firstCharacterWithString:(NSString *)string{
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pingyin = [str capitalizedString];
    return [pingyin substringToIndex:1];
}
//获取IP地址
+ (NSString *)getDeviceIPIpAddresses


{
    
    
    
    int sockfd =socket(AF_INET,SOCK_DGRAM, 0);
    
    
    
    //    if (sockfd <</span> 0) return nil;
    
    
    
    NSMutableArray *ips = [NSMutableArray array];
    
    
    
    
    
    
    
    int BUFFERSIZE =4096;
    
    
    
    struct ifconf ifc;
    
    
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    
    
    struct ifreq *ifr, ifrcopy;
    
    
    
    ifc.ifc_len = BUFFERSIZE;
    
    
    
    ifc.ifc_buf = buffer;
    
    
    
    if (ioctl(sockfd,SIOCGIFCONF, &ifc) >= 0){
        
        
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            
            
            ifr = (struct ifreq *)ptr;
            
            
            
            int len =sizeof(struct sockaddr);
            
            
            
            if (ifr->ifr_addr.sa_len > len) {
                
                
                
                len = ifr->ifr_addr.sa_len;
                
                
                
            }
            
            
            
            ptr += sizeof(ifr->ifr_name) + len;
            
            
            
            if (ifr->ifr_addr.sa_family !=AF_INET) continue;
            
            
            
            if ((cptr = (char *)strchr(ifr->ifr_name,':')) != NULL) *cptr =0;
            
            
            
            if (strncmp(lastname, ifr->ifr_name,IFNAMSIZ) == 0)continue;
            
            
            
            memcpy(lastname, ifr->ifr_name,IFNAMSIZ);
            
            
            
            ifrcopy = *ifr;
            
            
            
            ioctl(sockfd,SIOCGIFFLAGS, &ifrcopy);
            
            
            
            if ((ifrcopy.ifr_flags &IFF_UP) == 0)continue;
            
            
            
            
            
            
            
            NSString *ip = [NSString stringWithFormat:@"%s",inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            
            
            
            [ips addObject:ip];
            
            
            
        }
        
        
        
    }
    
    
    
    close(sockfd);
    
    NSString *deviceIP =@"";
    
    
    for (int i=0; i < ips.count; i++)
        
    {
        
        if (ips.count >0)
            
        {
            
            
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
            
        }
        
    }
    
    
    NSLog(@"deviceIP========%@",deviceIP);
    
    return deviceIP;
    
    
}
//等比缩放
+ (UIImage*)scaleToSize:(CGSize)size andImage:(UIImage *)selfImage
{
    CGFloat width = CGImageGetWidth(selfImage.CGImage);
    CGFloat height = CGImageGetHeight(selfImage.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [selfImage drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

//缩放到指定大小

+ (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)frame
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(frame);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}
+ (BOOL)validateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
+ (BOOL) IsEmailAdress:(NSString *)Email
{
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}
@end
