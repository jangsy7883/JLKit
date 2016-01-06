//
//  NSTimeZone+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 10. 9..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSTimeZone+JLAdditions.h"

@implementation NSTimeZone (JLAdditions)

+ (NSTimeZone*)GMT
{
    return [NSTimeZone timeZoneWithName:@"GMT"];
}

@end
