//
//  NSTimeZone+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 9..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSTimeZone+JLKit.h"

@implementation NSTimeZone (JLKit)

+ (NSTimeZone*)GMT {
    return [NSTimeZone timeZoneWithName:@"GMT"];
}

@end
