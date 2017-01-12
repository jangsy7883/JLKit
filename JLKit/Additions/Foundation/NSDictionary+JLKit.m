//
//  NSDictionary+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDictionary+JLKit.h"
#import "NSArray+JLKit.h"

@implementation NSDictionary (Additions)

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

- (id)objectOfKey:(id)key excludedNullValue:(BOOL)excludedNullValue {
    id value = self[key];
    if (excludedNullValue == YES && [value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

- (id)objectOfFirstMatchInKeys:(NSArray*)keys {
    return [self objectOfFirstMatchInKeys:keys excludedNullValue:NO];
}

- (id)objectOfFirstMatchInKeys:(NSArray*)keys excludedNullValue:(BOOL)excludedNullValue {
    for (id key in keys) {
        if (self[key] != nil) {
            id value = self[key];
            
            if (!(excludedNullValue == YES && [value isKindOfClass:[NSNull class]])) {
                return value;;
            }
        }
    }
    return nil;
}

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in self) {
        id object = [self objectForKey:key];
        
        if (object == nul){
            [replaced setObject:blank forKey:key];
        }
        else if ([object isKindOfClass:[NSDictionary class]]) {
            [replaced setObject:[object dictionaryByReplacingNullsWithBlanks] forKey:key];
        }
        else if ([object isKindOfClass:[NSArray class]]) {
            [replaced setObject:[object arrayByReplacingNullsWithBlanks] forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end

@implementation NSMutableDictionary (Additions)

- (void)setSafeObject:(id)anObject forKey:(id <NSCopying>)key {
    
    if(anObject == nil || anObject == [NSNull null]) {
        return;
    }
    
    if([anObject isKindOfClass: [NSString class]] && [anObject length] == 0) {
        return;
    }
    
    self[key] = anObject;
}

@end
