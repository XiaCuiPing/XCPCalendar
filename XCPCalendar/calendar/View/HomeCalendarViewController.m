//
//  HomeCalendarViewController.m
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import "HomeCalendarViewController.h"

@interface HomeCalendarViewController ()

@end

NSString *const CalendarCellIdentifier = @"cell";

@implementation HomeCalendarViewController

- (instancetype)init
{
    self = [super init];
    if (!self) {
        self = [[HomeCalendarViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelecteDate:) name:@"DID_SELETED_DATEVIEW" object:nil];
    
    [self.view addSubview:[self getTitleView]];
    
    XCPCalendarScrollView *calenardarScrollView = [[XCPCalendarScrollView alloc] initWithFrame:CGRectMake(0, 50, SWIDTH, SHEIGHT-50)];
    calenardarScrollView.backgroundColor = [UIColor clearColor];
    calenardarScrollView.decelerationRate = 1.0;
    calenardarScrollView.delegateForCell = self;
    [self.view addSubview:calenardarScrollView];
}

-(UIView *)getTitleView
{
    //
    NSArray *titleArry = @[@"周日",@"一",@"二",@"三",@"四",@"五",@"六"];
    CGFloat width = SWIDTH / 7;
    UIView *weekView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT-50)];
    
    for (int i = 0; i < titleArry.count; i++) {
        UILabel *lab = [[UILabel alloc] init ];
        lab.text = titleArry[i];
        lab.font = [UIFont systemFontOfSize:18.0];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = [UIColor whiteColor];
        if (i == 1 || i == 7) {
            lab.textColor = [UIColor whiteColor];
        }
        CGFloat labH = SHEIGHT * 0.215 - 44;
        if (SHEIGHT == 736) {
            lab.frame = CGRectMake(i * width, 32, width, labH);
        }else if ([UIScreen mainScreen].bounds.size.height == 568){
            lab.frame = CGRectMake(i * width, 12, width, 18);
        }else{
            lab.frame = CGRectMake(i * width, 15, width, 20);
        }
        [weekView addSubview:lab];
    }
    return weekView;
}

-(XCPLinearView *)getTipLabel:(NSString *)string
{
    if (!_lineView) {
        
        _lineView = [[XCPLinearView alloc] initWithFrame:CGRectMake(0, 50, SWIDTH, 50)];
        _lineView.backgroundColor = [UIColor clearColor];
        _lineView.hidden = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 35)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14.0];
        label.tag = 100;
        [_lineView addSubview:label];
        _lineView.alpha = 0.0;
        [self.view addSubview:_lineView];
    }
    UILabel *label = [_lineView viewWithTag:100];
    label.text = string;
    return _lineView;
}

-(void)didSelecteDate:(NSNotification *)notification
{
    NSDictionary * dict = notification.userInfo;
    XCPDateModel *model = (XCPDateModel *)[dict objectForKey:@"dateModel"];
    int week = (int)model.weekday;
    NSString *str_week;
    switch (week) {
        case 1:
            str_week = @"周一";
            break;
        case 2:
            str_week = @"周二";
            break;
        case 3:
            str_week = @"周三";
            break;
        case 4:
            str_week = @"周四";
            break;
        case 5:
            str_week = @"周五";
            break;
        case 6:
            str_week = @"周六";
            break;
        default:
            str_week = @"周日";
            break;
    }
    
    NSString *toString = [NSString stringWithFormat:@"%ld-%ld-%ld  %@",(long)model.year,(long)model.month,(long)model.day,str_week];
    
    if (_delegate && [_delegate respondsToSelector:@selector(didCompleteTime:text:)]) {
        [_delegate didCompleteTime:notification text:toString];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(XCPCalendarScrollViewCell *)calendarScrollViewCellWithDeviation:(NSInteger)deviation calendarScrollView:(XCPCalendarScrollView *)calendarScrollView
{
    static NSString *cellID = @"cellID";
    
    XCPCalendarScrollViewCell *cell = [calendarScrollView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XCPCalendarScrollViewCell alloc] initWithIdentifier:cellID];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        XCPCellDateModel *cellDateModel = [XCPDateTools dateToCell:deviation];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell fillDate:cellDateModel];
        });
    });
    
    return cell;
}

-(CGFloat)calendarScrollViewCellHeightWithdeviation:(NSInteger)deviation calendarScrollView:(XCPCalendarScrollView *)calendarScrollView{
    
    NSInteger row = [XCPDateTools getDrawRow:deviation];
    CGFloat width = (self.view.frame.size.width-20)/7.0;
    return (width+15)*row+10+30;
}

-(void)didSelectedWithDeviation:(NSInteger)deviation calendarScrollView:(XCPCalendarScrollView *)calendarScrollView
{
        NSLog(@"%ld",(long)deviation);
}

-(void)calendarScrollViewArriveTopVisible:(NSInteger)deviation
{
    NSDateComponents *components = [XCPDateTools getCellMonthDate:deviation];
    NSString *string = [NSString stringWithFormat:@"%ld年%ld月",(long)[components year],(long)[components month]];
    XCPLinearView *lineView = [self getTipLabel:string];
    if (lineView.hidden == YES) {
        lineView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            lineView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.6 animations:^{
                lineView.alpha = 0.6;
            } completion:^(BOOL finished) {
                lineView.hidden = YES;;
            }];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
