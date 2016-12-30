//
//  HomeCalendarViewController.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPConfig.h"
#import "XCPDateModel.h"
#import "XCPCellDateModel.h"
#import "XCPLinearView.h"
#import "XCPDateTools.h"
#import "XCPCalendarScrollView.h"
#import "XCPCalendarScrollViewCell.h"

@protocol HomeCalendarViewControllerDelegate <NSObject>

@optional

- (void)didCompleteTime:(NSNotification *)completeTime text:(NSString *)text;

@end

@interface HomeCalendarViewController : UIViewController <XCPCalendarScrollViewDelegate>
{
    XCPLinearView *_lineView;
    NSInteger _currentYear;
    NSInteger _currentMonth;
    NSInteger _currentDay;
    NSInteger _currentWeekday;
    NSInteger _lastCellDeviation;
    NSMutableDictionary *_cell;
}

@property(nonatomic, strong) id<HomeCalendarViewControllerDelegate> delegate;

@end
