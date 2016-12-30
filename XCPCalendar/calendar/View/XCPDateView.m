//
//  XCPDateView.m
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import "XCPDateView.h"

@implementation XCPDateView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        _solarCalendarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height*0.6)];
        _lunarCalendarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, width*0.45, width, width*0.3)];
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _bgView.backgroundColor = [UIColor clearColor];
        _bgView.layer.cornerRadius = width/2.0;
        _bgView.layer.masksToBounds = YES;
        [self addSubview:_bgView];
        [self addSubview:_solarCalendarLabel];
        [self addSubview:_lunarCalendarLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _bgView.backgroundColor = [UIColor redColor];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _bgView.backgroundColor = [UIColor whiteColor];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _bgView.backgroundColor = [UIColor clearColor];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DID_SELETED_DATEVIEW" object:nil userInfo:@{@"dateModel":self.dateModel}];
}

-(void)fillDate:(XCPDateModel *)dateModel
{
    _dateModel = dateModel;
    self.solarCalendarLabel.text = [NSString stringWithFormat:@"%ld",(long)dateModel.day];
    self.lunarCalendarLabel.text = dateModel.lunarDay;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.solarCalendarLabel.textAlignment = NSTextAlignmentCenter;
    
    self.lunarCalendarLabel.font = [UIFont systemFontOfSize:9.0];
    self.lunarCalendarLabel.textAlignment = NSTextAlignmentCenter;
    
    NSDate *today = [NSDate date];
    NSDate *tomonth = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    NSDateFormatter *dateMonth = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd"];
    [dateMonth setDateFormat:@"MM"];
    NSInteger day = [[dateFormater stringFromDate:today] integerValue];
    NSInteger month = [[dateMonth stringFromDate:tomonth] integerValue];
    if (month == self.dateModel.month && day == self.dateModel.day) {
        _bgView.backgroundColor = [UIColor redColor];
    }
}

@end
