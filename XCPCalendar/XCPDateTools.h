//
//  XCPDateTools.h
//  XCPCalendar
//
//  Created by Apple on 2016/12/26.
//  Copyright © 2016年 夏翠萍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCPCellDateModel.h"
#import "XCPDateModel.h"

@class XCPCellDateModel;

@interface XCPDateTools : NSObject

+(XCPCellDateModel *)dateToCell:(NSInteger)deviation;
+(NSInteger)getDrawRow:(NSInteger)deviation;
+(NSDateComponents *)getCurrentDate:(NSInteger)deviation;
+(NSDateComponents *)getCellMonthDate:(NSInteger)deviation;

@end
