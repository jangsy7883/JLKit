//
//  NSDictionary+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDictionary+JLAdditions.h"

@implementation NSDictionary (Additions)

- (NSString*)stringValue
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

@end

@implementation NSMutableDictionary (Additions)

- (void)setSafeObject:(id)anObject forKey:(id <NSCopying>)aKey
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
    
    [self setObject:anObject forKey:aKey];
}


@end
