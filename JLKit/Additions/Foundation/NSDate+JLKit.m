//
//  NSDate+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDate+JLKit.h"
#import "NSTimeZone+JLKit.h"

@implementation NSDate (Additions)

+ (NSDateFormatter*)sharedDateFormatter
{
    static dispatch_once_t once;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&once, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
    });
    return dateFormatter;
}

- (NSCalendarUnit)componentFlags
{
    return (
            NSCalendarUnitYear
            | NSCalendarUnitMonth
            | NSCalendarUnitDay
            | NSCalendarUnitHour
            | NSCalendarUnitMinute
            | NSCalendarUnitSecond
            | NSCalendarUnitNanosecond
            | NSCalendarUnitWeekday
            | NSCalendarUnitWeekdayOrdinal
            | NSCalendarUnitQuarter
            | NSCalendarUnitWeekOfMonth
            | NSCalendarUnitWeekOfYear
            );
}

#pragma mark - formatter

+ (NSDate*)dateFromString:(NSString*)dateString dateFormat:(NSString*)dateFormat timeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    dateFormatter.timeZone = timeZone;
    dateFormatter.dateFormat = dateFormat;
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSDate*)dateFromString:(NSString*)dateString dateFormat:(NSString*)dateFormat
{
    return [self dateFromString:dateString
                     dateFormat:dateFormat
                       timeZone:[NSTimeZone GMT]];
}

- (NSString*)stringFromDateFormat:(NSString*)stringFormat timeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter];
    dateFormatter.timeZone = timeZone;
    dateFormatter.dateFormat = stringFormat;
    
    return [dateFormatter stringFromDate:self];
}

- (NSString*)stringFromDateFormat:(NSString*)stringFormat
{
    return [self stringFromDateFormat:stringFormat
                             timeZone:[NSTimeZone systemTimeZone]];
}

#pragma mark - Unit

- (NSInteger)valueForComponent:(NSCalendarUnit)unit
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:unit fromDate:self];
    components.calendar = [NSCalendar currentCalendar];
    
    return [components valueForComponent:unit];
}

- (NSDate*)dateByAddingCount:(NSInteger)count forComponent:(NSCalendarUnit)unit
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:[self componentFlags] fromDate:self];
    components.calendar = [NSCalendar currentCalendar];
    
    NSInteger value =  [components valueForComponent:unit];
    
    [components setValue:value+count forComponent:unit];
    
    return components.date;
}

#pragma mark - Equal

- (BOOL)isEqualDayToDate:(NSDate *)date
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:[self componentFlags] fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:[self componentFlags] fromDate:date];
    return ((components1.year == components2.year)
            && (components1.month == components2.month)
            && (components1.day == components2.day));
}

#pragma mark - GETTERS

- (BOOL)isToday
{
    return [self isEqualDayToDate:[NSDate date]];
}

- (BOOL)isYesterday
{
    NSDate *yesterday = [[NSDate date] dateByAddingCount:-1 forComponent:NSCalendarUnitDay];
    return [self isEqualDayToDate:yesterday];
}

- (NSInteger)year
{
    return [self valueForComponent:NSCalendarUnitYear];
}

- (NSInteger)month
{
    return [self valueForComponent:NSCalendarUnitMonth];
}

- (NSInteger)day
{
    return [self valueForComponent:NSCalendarUnitDay];
}

- (NSInteger)hour
{
    return [self valueForComponent:NSCalendarUnitHour];
}

- (NSInteger)minute
{
    return [self valueForComponent:NSCalendarUnitMinute];
}

- (NSInteger)second
{
    return [self valueForComponent:NSCalendarUnitSecond];
}

- (NSInteger)weekDay
{
    return [self valueForComponent:NSCalendarUnitWeekday];
}

@end
