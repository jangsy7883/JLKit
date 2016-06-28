//
//  NSDictionary+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDictionary+JLKit.h"

@implementation NSDictionary (Additions)

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

- (id)objectOfFirstMatchInKeys:(NSArray*)keys
{
    for (id key in keys)
    {
        if (self[key] != nil)
        {
            return self[key];
        }
    }
    return nil;
}

@end

@implementation NSMutableDictionary (Additions)

- (void)setSafeObject:(id)anObject forKey:(id <NSCopying>)key
{
    // skip nils and NSNull
    if(anObject == nil || anObject == [NSNull null])
    {
        return;
    }
    
    // skip empty string
    if([anObject isKindOfClass: [NSString class]] && [anObject length] == 0)
    {
        return;
    }
    
    self[key] = anObject;
}

@end
