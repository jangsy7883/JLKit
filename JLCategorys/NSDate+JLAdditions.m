//
//  NSDate+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
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

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString withTimeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
    {
        dateFormatter.timeZone = timeZone;
    }
    
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString
{
    return [self dateFromFormat:dateFormat
                     dateString:dateString
                   withTimeZone:[NSTimeZone GMT]];
}

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat withTimeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter];
    if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
    {
        dateFormatter.timeZone = timeZone;
    }
    
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
    [components setCalendar:[NSCalendar currentCalendar]];
    [components setYear:[components year] + parm_year];
    
    return [components date];
}

@end
