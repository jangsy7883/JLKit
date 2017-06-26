//
//  NSArray+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSArray+JLKit.h"
#import "NSDictionary+JLKit.h"

@implementation NSArray (Additions)

- (NSString*)JSONValue {
    NSError *error = nil;
    NSData* kData = [NSJSONSerialization dataWithJSONObject:self
                                                    options:NSJSONWritingPrettyPrinted
                                                      error:&error];
    if (error == nil) {
        return [[NSString alloc] initWithData:kData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (BOOL)emptyAtIndex:(NSInteger)index {
    return ([self objectAtSafeIndex:index] == nil);
}

- (id)objectAtSafeIndex:(NSInteger)index {
    id object = nil;
    @try {
        if (index != NSNotFound && self.count > index && self.count > 0)
        {
            object = self[index];
        }
    }
    @catch (NSException *exception) {
    }
    return object;
}

- (NSArray *)arrayByReplacingUsingBlock:(id (^)(id object))block {
    if (block) {
        NSMutableArray *replacementArray = [NSMutableArray array];
        
        for (NSString *object in self) {
            id replacementObject = block(object);
            
            if (replacementObject != nil) {
                [replacementArray addSafeObject:replacementObject];
            }
            else {
                [replacementArray addSafeObject:object];
            }
        }
        return replacementArray;
    }
    
    return self;
}

- (NSArray *)arrayByReplacingNullsWithBlanks  {
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul) {
            [replaced replaceObjectAtIndex:idx withObject:blank];
        }
        else if ([object isKindOfClass:[NSDictionary class]]) {
            [replaced replaceObjectAtIndex:idx withObject:[object dictionaryByReplacingNullsWithBlanks]];
        }
        else if ([object isKindOfClass:[NSArray class]]) {
            [replaced replaceObjectAtIndex:idx withObject:[object arrayByReplacingNullsWithBlanks]];
        }
    }
    return [replaced copy];
}

- (id)objectOfObjectPassingTest:(BOOL (NS_NOESCAPE ^)(id obj, NSUInteger idx, BOOL *stop))predicate  {
    NSUInteger index = [self indexOfObjectPassingTest:predicate];
    if (index != NSNotFound) {
        return [self objectAtSafeIndex:index];
    }
    return nil;
}

- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending {
    return [self sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

@end

@implementation NSMutableArray (Additions)

- (void)removeObjectAtSafeIndex:(NSUInteger)index {
    @try {
        if ([self emptyAtIndex:index] == NO)
        {
            [self removeObjectAtIndex:index];
        }
    }
    @catch (NSException *exception) {
    }
}

- (void)addSafeObject:(id)anObject {
    @try {
        if (anObject != nil)
        {
            [self addObject:anObject];
        }
    }
    @catch (NSException *exception) {}
}

@end
