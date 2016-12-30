//
//  XCPDateView.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPDateModel.h"

@class XCPDateModel;

@interface XCPDateView : UIView
{
    UIView *_bgView;
}

@property(nonatomic,strong)UILabel *solarCalendarLabel;
@property(nonatomic,strong)UILabel *lunarCalendarLabel;
@property(nonatomic,strong)XCPDateModel *dateModel;

-(void)fillDate:(XCPDateModel *)dateModel;

@end
