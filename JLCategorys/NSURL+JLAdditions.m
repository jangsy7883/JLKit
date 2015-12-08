//
//  NSURL+JLAdditions.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 8..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSURL+JLAdditions.h"

@implementation NSURL (JLAdditions)

- (NSDictionary*)queryParameters
{
    NSMutableDictionary* queryParams = [NSMutableDictionary dictionary];
    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];

    
    for (NSURLQueryItem* queryItem in [urlComponents queryItems])
    {
        if (queryItem.value != nil)
        {
            [queryParams setObject:queryItem.value forKey:queryItem.name];
        }
    }
    
    return queryParams;
}

@end
