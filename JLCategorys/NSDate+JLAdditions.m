//
//  NSDate+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDate+JLAdditions.h"

@implementation NSDate (Additions)

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString timeZone:(NSString*)timeZone
{
    /* CHECK -----------------------------------------------------------------*/
    if (dateFormat == nil || [dateFormat length] <= 0)
    {
        return nil;
    }
    if (dateString == nil || [dateString length] <= 0)
    {
        return nil;
    }

    /* INIT ------------------------------------------------------------------*/
    NSDateFormatter *dateFormatter = nil;

    /* LOGIC -----------------------------------------------------------------*/
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale autoupdatingCurrentLocale];
    [dateFormatter setDateFormat:dateFormat];
    if (dateFormat != nil)
    {
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    }
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString
{
    return [self dateFromFormat:dateFormat
                     dateString:dateString
                       timeZone:@"GMT"];
}

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat timeZone:(NSString*)parm_timeZone
{
    /* CHECK -----------------------------------------------------------------*/
    if (parm_stringFormat == nil || [parm_stringFormat length] <= 0)
    {
        return nil;
    }

    /* LOGIC -----------------------------------------------------------------*/
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale autoupdatingCurrentLocale];
    [dateFormatter setDateFormat:parm_stringFormat];
    if (parm_timeZone != nil)
    {
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:parm_timeZone]];
    }
    
    return [dateFormatter stringFromDate:self];
}

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat
{
    return [self stringFromFormat:parm_stringFormat
                         timeZone:@"GMT"];
}

@end
