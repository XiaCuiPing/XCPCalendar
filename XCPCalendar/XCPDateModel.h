//
//  XCPDateModel.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCPDateModel : NSObject

@property(nonatomic,assign)NSInteger day;
@property(nonatomic,assign)NSInteger month;
@property(nonatomic,assign)NSInteger year;
@property(nonatomic,assign)NSInteger weekday;
@property(nonatomic,assign)NSString *lunarDay;

@end
