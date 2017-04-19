//
//  NSArray+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<ObjectType> (Additions)

@property (nonatomic, readonly, copy) NSString *JSONValue;

- (BOOL)emptyAtIndex:(NSInteger)index;

- (id)objectAtSafeIndex:(NSInteger)index;

- (NSArray *)arrayByReplacingUsingBlock:(id (^)(id object))block;
- (NSArray *)arrayByReplacingNullsWithBlanks;

- (ObjectType)objectOfObjectPassingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

@end

@interface NSMutableArray (Additions)

- (void)removeObjectAtSafeIndex:(NSUInteger)index;
- (void)addSafeObject:(id)anObject;

@end
