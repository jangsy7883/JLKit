//
//  NSArray+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSArray+JLKit.h"

@implementation NSArray (Additions)

- (NSString*)JSONValue
{
    NSError *error = nil;
    NSData* kData = [NSJSONSerialization dataWithJSONObject:self
                                                    options:NSJSONWritingPrettyPrinted
                                                      error:&error];    
    if (error == nil)
    {
        return [[NSString alloc] initWithData:kData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (BOOL)emptyAtIndex:(NSInteger)index
{
    return ([self objectAtSafeIndex:index] == nil);
}

- (id)objectAtSafeIndex:(NSInteger)index
{
    id object = nil;
    @try
    {
        if (index != NSNotFound && self.count > index && self.count > 0)
        {
            object = self[index];
        }
    }
    @catch (NSException *exception)
    {
    }
    return object;
}

- (NSArray*)replacementArrayUsingBlock:(id (^)(id object))block
{
    if (block)
    {
        NSMutableArray *replacementArray = [NSMutableArray array];
        
        for (NSString *object in self)
        {
            id replacementObject = block(object);
            
            if (replacementObject != nil)
            {
                [replacementArray addSafeObject:replacementObject];
            }
            else
            {
                [replacementArray addSafeObject:object];
            }
        }
        
        return replacementArray;
    }

    return self;
}

@end

@implementation NSMutableArray (Additions)

- (void)removeObjectAtSafeIndex:(NSUInteger)index
{
    @try
    {
        if ([self emptyAtIndex:index] == NO)
        {
            [self removeObjectAtIndex:index];
        }
    }
    @catch (NSException *exception)
    {
    }
}

- (void)addSafeObject:(id)anObject
{
    @try {
        if (anObject != nil)
        {
            [self addObject:anObject];
        }
    }
    @catch (NSException *exception) {}
}

@end
