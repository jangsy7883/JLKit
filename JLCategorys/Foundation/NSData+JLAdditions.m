//
//  NSData+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 31..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSData+JLAdditions.h"

@implementation NSData (JLAdditions)

- (NSString *)UTF8String
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
