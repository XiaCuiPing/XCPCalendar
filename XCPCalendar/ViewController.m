//
//  ViewController.m
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import "ViewController.h"
#import "XCPConfig.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timeDateBtn = _timeDateBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    _timeDateBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, SWIDTH-200, 40)];
    [_timeDateBtn setTitle:@"选择时间" forState:UIControlStateNormal];
    [_timeDateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _timeDateBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    _timeDateBtn.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];
    _timeDateBtn.layer.cornerRadius = 12.0;
    _timeDateBtn.layer.masksToBounds = YES;
    [_timeDateBtn addTarget:self action:@selector(timeCalendar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_timeDateBtn];
    
}

- (void)timeCalendar:(UIButton *)btn
{
    HomeCalendarViewController *homeCalendarView = [[HomeCalendarViewController alloc] init];
    homeCalendarView.delegate = self;
    [self presentViewController:homeCalendarView animated:YES completion:nil];
}

#pragma mark - CompleteTimeViewControllerDelegate
- (void)didCompleteTime:(NSNotification *)btton text:(NSString *)text
{
    [_timeDateBtn setTitle:text forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
