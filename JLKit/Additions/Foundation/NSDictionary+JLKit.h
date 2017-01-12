//
//  NSDictionary+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

@property (nonatomic, readonly, copy) NSString *__nullable JSONValue;

- (nullable id)objectForKey:(nonnull id)aKey excludedNullValue:(BOOL)excludedNullValue;

- (nullable id)objectForFirstMatchInKeys:(nonnull NSArray*)keys;
- (nullable id)objectForFirstMatchInKeys:(nonnull NSArray*)keys excludedNullValue:(BOOL)excludedNullValue;

- (nonnull NSDictionary *)dictionaryByReplacingNullsWithBlanks;
    
@end

@interface NSMutableDictionary (Additions)

- (void)setSafeObject:(nullable id)anObject forKey:(nonnull id <NSCopying>)key;

@end
