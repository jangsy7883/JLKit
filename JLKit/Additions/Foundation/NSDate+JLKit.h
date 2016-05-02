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

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger weekDay;

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString timeZone:(NSTimeZone*)timeZone;
+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString;

- (NSString*)stringFromFormat:(NSString*)stringFormat timeZone:(NSTimeZone*)timeZone;
- (NSString*)stringFromFormat:(NSString*)stringFormat;

- (BOOL)isEqualDayToDate:(NSDate *)date;

- (NSInteger)valueForComponent:(NSCalendarUnit)unit;
- (NSDate*)dateByAddingCount:(NSInteger)count forComponent:(NSCalendarUnit)unit;

@end
