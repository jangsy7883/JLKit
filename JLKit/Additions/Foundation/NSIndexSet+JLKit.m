//
//  NSIndexSet+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2016. 6. 25..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "NSIndexSet+JLKit.h"

@implementation NSIndexSet (JLKit)

- (NSArray<NSNumber*>*)arrayValue {
    if (self.count > 0) {
        NSMutableArray *indexs = [NSMutableArray array];
        
        [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            [indexs addObject:@(idx)];
        }];
        
        return indexs;
    }
    return nil;
}

@end
