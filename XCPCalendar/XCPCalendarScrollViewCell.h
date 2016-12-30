//
//  XCPCalendarScrollViewCell.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPCellDateModel.h"
#import "XCPDateView.h"
#import "XCPDateModel.h"
#import "XCPDateTools.h"

@class XCPCellDateModel;


@interface XCPCalendarScrollViewCell : UIView
{
    NSInteger _year;
    NSInteger _month;
    NSInteger _day;
    NSInteger _weekday;
}


@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,assign)NSInteger deviation;
@property(nonatomic,strong)UILabel *label;
-(instancetype)initWithIdentifier:(NSString *)identifier;
-(void)fillDate:(XCPCellDateModel *)cellDateModel;

@end
