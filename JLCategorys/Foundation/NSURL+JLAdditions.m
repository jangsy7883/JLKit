//
//  NSURL+JLAdditions.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 12. 8..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSURL+JLAdditions.h"

@implementation NSURL (JLAdditions)

- (NSDictionary*)queryParameters
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *param in [[self query] componentsSeparatedByString:@"&"])
    {
        NSArray *parts = [param componentsSeparatedByString:@"="];
        if([parts count] < 2) continue;
        [params setObject:[parts objectAtIndex:1] forKey:[parts objectAtIndex:0]];
    }
    return params;
//    NSMutableDictionary* queryParams = [NSMutableDictionary dictionary];
//    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];
//
//    
//    for (NSURLQueryItem* queryItem in [urlComponents queryItems])
//    {
//        if (queryItem.value != nil)
//        {
//            [queryParams setObject:queryItem.value forKey:queryItem.name];
//        }
//    }
//    
//    return queryParams;
}

@end
