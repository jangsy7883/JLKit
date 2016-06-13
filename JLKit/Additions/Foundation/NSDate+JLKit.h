//
//  NSDate+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

@property (nonatomic, readonly, getter=isToday) BOOL today;
@property (nonatomic, readonly, getter=isYesterday) BOOL yesterday;

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger weekDay;

+ (NSDate*)dateFromString:(NSString*)dateString dateFormat:(NSString*)dateFormat timeZone:(NSTimeZone*)timeZone;
+ (NSDate*)dateFromString:(NSString*)dateString dateFormat:(NSString*)dateFormat;

- (NSString*)stringFromDateFormat:(NSString*)stringFormat timeZone:(NSTimeZone*)timeZone;
- (NSString*)stringFromDateFormat:(NSString*)stringFormat;

- (BOOL)isEqualDayToDate:(NSDate *)date;

- (NSInteger)valueForComponent:(NSCalendarUnit)unit;
- (NSDate*)dateByAddingCount:(NSInteger)count forComponent:(NSCalendarUnit)unit;

@end
