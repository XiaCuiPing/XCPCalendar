//
//  XCPLinearView.m
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import "XCPLinearView.h"

@implementation XCPLinearView

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawGradient:context];
}

#pragma mark 线性渐变
-(void)drawGradient:(CGContextRef)context
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[8] = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,0.8};
    CGFloat locations[2] = {0.0,1.0,};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    //绘制渐变
    CGContextDrawLinearGradient(context, gradient, CGPointMake(2.0f, 5.0f), CGPointMake(0, self.frame.size.height), 0);
    
    //释放对象
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
