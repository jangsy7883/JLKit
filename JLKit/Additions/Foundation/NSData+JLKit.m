//
//  NSData+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 31..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSData+JLKit.h"

@implementation NSData (JLKit)

- (NSString *)UTF8String {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
