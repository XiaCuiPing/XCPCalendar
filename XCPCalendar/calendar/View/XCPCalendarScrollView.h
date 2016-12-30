//
//  XCPCalendarScrollView.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPCalendarScrollViewCell.h"

@class XCPCalendarScrollView;
@class XCPCalendarScrollViewCell;


@protocol XCPCalendarScrollViewDelegate <NSObject>

-(XCPCalendarScrollViewCell *)calendarScrollViewCellWithDeviation:(NSInteger)deviation  calendarScrollView:(XCPCalendarScrollView *)calendarScrollView;

@optional
-(CGFloat)calendarScrollViewCellHeightWithdeviation:(NSInteger)deviation calendarScrollView:(XCPCalendarScrollView *)calendarScrollViewb;

-(void)didSelectedWithDeviation:(NSInteger)deviation calendarScrollView:(XCPCalendarScrollView *)calendarScrollView;

-(void)calendarScrollViewArriveTopVisible:(NSInteger)deviation;

@end


@interface XCPCalendarScrollView : UIScrollView

@property (nonatomic, strong) UIView *subViewContainerView;
@property(nonatomic,strong)NSMutableArray*  visiableCells;

@property(nonatomic,strong)NSMutableDictionary* reusableTableCells;

@property(nonatomic,assign)id<XCPCalendarScrollViewDelegate> delegateForCell;

-(XCPCalendarScrollViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

@end
