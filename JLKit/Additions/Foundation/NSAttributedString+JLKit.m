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

- (void)appendString:(NSString*)string attributes:(NSDictionary*)attributes
{
    if (string.length > 0 && attributes.allKeys.count > 0)
    {
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string
                                                                               attributes:attributes];
        [self appendAttributedString:attributedString];
    }
}

@end

@implementation NSAttributedString (JLKit)

+ (instancetype)attributedString:(NSString*)string attributes:(NSDictionary<NSString *, id> *)attrs
{
    return [[[self class] alloc] initWithString:string attributes:attrs];
}

@end
