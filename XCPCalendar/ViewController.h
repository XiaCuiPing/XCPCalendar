//
//  ViewController.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCalendarViewController.h"

@interface ViewController : UIViewController <HomeCalendarViewControllerDelegate>

@property(nonatomic, readonly)UIButton *timeDateBtn;

@end

