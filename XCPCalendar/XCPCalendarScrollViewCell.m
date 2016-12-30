//
//  XCPCalendarScrollViewCell.m
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import "XCPCalendarScrollViewCell.h"

@implementation XCPCalendarScrollViewCell

-(instancetype)initWithIdentifier:(NSString *)identifier
{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    self = [super initWithFrame:frame];
    if (self) {
        self.identifier = identifier;
    }
    return self;
}

-(void)fillDate:(XCPCellDateModel *)cellDateModel
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat width = (self.frame.size.width-20)/7.0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((cellDateModel.beginWeekDay-1)*width+10, 5, width, 30)];
    label.text = [NSString stringWithFormat:@"%ld月",(long)cellDateModel.month];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    [self addSubview:label];
    
    for (int i = 0; i < cellDateModel.monthDays; i++) {
        XCPDateModel *dateModel = cellDateModel.dateModelArray[i];
        NSInteger column =  dateModel.weekday;
        NSInteger row = (i+cellDateModel.drawDayBeginIndex)/7;
        
        XCPDateView *dateView = [[XCPDateView alloc] initWithFrame:CGRectMake(column*width+10, row*(width+15)+5+30+5, width, width)];
        [dateView fillDate:dateModel];
        [self addSubview:dateView];
        
        if (i == 0) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake((cellDateModel.beginWeekDay-1)*width+10, row*(width+15)+5+30+4, self.frame.size.width-(cellDateModel.beginWeekDay-1)*width-20, 0.5)];
            view.backgroundColor = [UIColor clearColor];
            [self addSubview:view];
        }
        else
        {
            if ((i+cellDateModel.drawDayBeginIndex)%7 == 0) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, row*(width+15)+5+30+4, self.frame.size.width-20, 0.5)];
                view.backgroundColor = [UIColor clearColor];
                [self addSubview:view];
            }
        }
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
}


-(void)setDeviation:(NSInteger)deviation
{
    _deviation = deviation;
}

@end
