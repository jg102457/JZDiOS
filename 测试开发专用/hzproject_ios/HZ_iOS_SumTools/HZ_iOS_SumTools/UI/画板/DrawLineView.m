//
//  DrawLineView.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/12/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _beziPathArrM    = [[NSMutableArray alloc]init];
        _isErase = NO;
        _lineColor = [UIColor redColor];
        _lineWidth = 3;
        
        
        
       
        
    }
    return self;
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent      *)event{
    
   
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    //touchesBegan方法中初始化beziPath moveToPoint
    self.beziPath = [[SubBezierPath alloc] init];
    self.beziPath.lineColor = _lineColor;
    self.beziPath.isErase = _isErase;
    [self.beziPath moveToPoint:currentPoint];
    // 并将路径保存到数组中以保存数据
    [self.beziPathArrM addObject:self.beziPath];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    CGPoint midP = midPoint(previousPoint,currentPoint);
    
    //  touchesMoved方法中添加每一个点到self.beziPath中
    // 使用二次贝塞尔曲线比使用addLine画线更圆润拐点没有尖角
    [self.beziPath addQuadCurveToPoint:currentPoint controlPoint:midP];
    // 并主动调用绘画方法 <setNeedsDisplay会自动调用drawrect方法 不要直接调用drawrect方法>
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    CGPoint midP = midPoint(previousPoint,currentPoint);
    [self.beziPath addQuadCurveToPoint:currentPoint   controlPoint:midP];
    // touchesMoved
    [self setNeedsDisplay];
}
// 计算中间点
CGPoint midPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

//2.3 实现drawrect方法
#pragma mark - 绘画方法
- (void)drawRect:(CGRect)rect
{
    //获取上下文
    if(self.beziPathArrM.count){
        for (SubBezierPath *path  in self.beziPathArrM) {
            if (path.isErase) {
                // 橡皮擦设置无色
                [[UIColor grayColor] setStroke];
            }else{
                // 设置画笔颜色
                [path.lineColor setStroke];
            }
            
            path.lineJoinStyle = kCGLineJoinRound;
            path.lineCapStyle = kCGLineCapRound;
            if (path.isErase) {
                path.lineWidth =_lineWidth;
                // 设置橡皮擦状态的画线的模式
                [path strokeWithBlendMode:kCGBlendModeCopy alpha:1.0];
            } else {
                path.lineWidth = _lineWidth;
                // 设置正常画线的画线模式
                [path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
            }
            [path stroke];
        }
    }
    [super drawRect:rect];
}


//2.4 设置清楚画板功能
- (void)clear{
    [self.beziPathArrM removeAllObjects];
    [self setNeedsDisplay];
}
@end

