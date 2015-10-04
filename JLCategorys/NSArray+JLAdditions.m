//
//  NSArray+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSArray+JLAdditions.h"

@implementation NSArray (Additions)

- (BOOL)emptyAtIndex:(NSInteger)index
{
    return ([self objectAtSafeIndex:index] == nil);
}

- (id)objectAtSafeIndex:(NSInteger)index
{
    id object = nil;
    @try
    {
        object = self[index];
    }
    @catch (NSException *exception)
    {
        
    }
    
    return object;
}

@end
