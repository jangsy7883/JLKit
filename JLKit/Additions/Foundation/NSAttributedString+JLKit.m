//
//  NSAttributedString+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 10..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSAttributedString+JLKit.h"

@implementation NSMutableAttributedString (JLKit)

- (void)addAttributes:(NSDictionary*)attrs text:(NSString*)text
{
    @try
    {
        NSRange range = [self.string rangeOfString:text];
        if (range.length > 0)
        {
            [self addAttributes:attrs range:range];
        }
    }
    @catch (NSException *exception)
    {
        
    }
}

@end
