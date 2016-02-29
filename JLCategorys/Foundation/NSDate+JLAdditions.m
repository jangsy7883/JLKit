//
//  NSDate+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDate+JLAdditions.h"
#import "NSTimeZone+JLAdditions.h"

@implementation NSDate (Additions)

+ (NSDateFormatter*)sharedDateFormatter
{
    static dispatch_once_t once;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&once, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone GMT];
        dateFormatter.locale = [NSLocale currentLocale];
    });
    return dateFormatter;
}

+ (NSCalendar *) currentCalendar
{
    static dispatch_once_t once;
    static NSCalendar *sharedCalendar;
    dispatch_once(&once, ^{
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    });
    return sharedCalendar;
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString withTimeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
    {
        dateFormatter.timeZone = timeZone;
    }
    
    dateFormatter.dateFormat = dateFormat;
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString
{
    return [self dateFromFormat:dateFormat
                     dateString:dateString
                   withTimeZone:[NSTimeZone GMT]];
}

- (NSString*)stringFromFormat:(NSString*)stringFormat withTimeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter];
    if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
    {
        dateFormatter.timeZone = timeZone;
    }

    dateFormatter.dateFormat = stringFormat;
    
    return [dateFormatter stringFromDate:self];
}

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat
{
    return [self stringFromFormat:parm_stringFormat
                     withTimeZone:[NSTimeZone GMT]];
}

- (NSDate*)dateByAddingYear:(NSInteger)parm_year
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.calendar = [NSCalendar currentCalendar];
    components.year = components.year + parm_year;
    
    return components.date;
}

- (BOOL)isToday
{
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSCalendarUnit componentFlags = (NSCalendarUnitYear|
                                     NSCalendarUnitMonth |
                                     NSCalendarUnitDay |
                                     NSCalendarUnitWeekOfMonth |
                                     NSCalendarUnitHour |
                                     NSCalendarUnitMinute |
                                     NSCalendarUnitSecond |
                                     NSCalendarUnitWeekday |
                                     NSCalendarUnitWeekdayOrdinal);
    
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

@end
