//
//  XCPCellDateModel.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCPDateModel;

@interface XCPCellDateModel : NSObject

@property(nonatomic,strong)NSArray <__kindof XCPDateModel *> *dateModelArray;
@property(nonatomic,assign)NSInteger drawDayBeginIndex;
@property(nonatomic,assign)NSInteger drawDayRow;
@property(nonatomic,assign)NSInteger year;
@property(nonatomic,assign)NSInteger month;
@property(nonatomic,assign)NSInteger monthDays;
@property(nonatomic,assign)NSInteger beginWeekDay;

@end
