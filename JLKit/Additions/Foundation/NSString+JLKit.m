//
//  NSString+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSString+JLKit.h"
#import "NSArray+JLKit.h"

#include <CommonCrypto/CommonDigest.h>

@implementation NSString (Additions)

- (CGSize)sizeWithFont:(UIFont*)font
     constrainedToSize:(CGSize)size
             alignment:(NSTextAlignment)alignment
         lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if (self.length == 0 || font == nil) {
        return CGSizeZero;
    }
    
    CGSize fitSize = CGSizeZero;
    
    @try {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = alignment;
        paragraphStyle.lineBreakMode = lineBreakMode;
        
        fitSize = [self boundingRectWithSize:size
                                     options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                  attributes:@{
                                               NSFontAttributeName:font,
                                               NSParagraphStyleAttributeName:paragraphStyle
                                               }
                                     context:nil].size;
        
    }
    @catch (NSException *exception) {
        
    }

    return CGSizeMake(ceilf(fitSize.width), ceilf(fitSize.height));
}

- (NSString *)stringByAppendingPathComponents:(NSArray <NSString *>*)pathComponents {
    NSString *string = [pathComponents componentsJoinedByString:@"/"];
    return [self stringByAppendingPathComponent:string];
}

- (NSString*)deleteEmptySpace {
    return [[self stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString*)deleteLineSpace {
    return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
}

- (NSString*)deleteEmptyAndLineSpace {
    return self.deleteEmptySpace.deleteLineSpace;
}

- (BOOL)startsWith:(NSString *)prefix {
    if (self.length == 0) return FALSE;
    if (self.length < prefix.length) return FALSE;
    return [[self substringToIndex:prefix.length] isEqualToString:prefix];
}

- (BOOL)endWith:(NSString *)prefix {
    if (self.length == 0) return FALSE;
    if (self.length < prefix.length) return FALSE;
    return [[self substringFromIndex:self.length-prefix.length] isEqualToString:prefix];
}

+ (BOOL)emptyString:(NSString *)parm_string {
    if ([parm_string isKindOfClass:[NSString class]] == NO) {
        return YES;
    }
    if ((NSNull *) parm_string == [NSNull null]) {
        return YES;
    }
    
    if (parm_string == nil) {
        return YES;
    }
    else if (parm_string.length == 0 || parm_string.length == NSNotFound) {
        return YES;
    }
    else {
        parm_string = [parm_string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (parm_string.length == 0 || parm_string.length == NSNotFound)
        {
            return YES;
        }
    }
    
    return NO;
}

- (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator componentBlock:(id (^)(id component))block {
    NSArray *components = [self componentsSeparatedByString:separator];
    
    if (block) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSString* component in components)
        {
            id value = block(component);
            if (value != nil)
            {
                [array addSafeObject:value];
            }
            else
            {
                [array addSafeObject:component];
            }
        }
        return array;
    }
    
    return components;
}

#pragma mark - Regex Pattern

- (NSRegularExpression*)regexWithPattern:(NSString*)pattern {
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        return nil;
    }
    return regex;
}

- (NSRange)rangeOfFirstMatchInRegexPattern:(NSString*)pattern {
    NSRegularExpression *regex = [self regexWithPattern:pattern];
    if (regex) {
        return [regex rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    }
    return NSMakeRange(0, 0);
}

- (NSArray<NSTextCheckingResult *> *)matchesInRegexPattern:(NSString*)pattern {
    NSRegularExpression *regex = [self regexWithPattern:pattern];
    if (regex) {
        return [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    }
    return nil;
}

- (BOOL)isValidInRegexPattern:(NSString*)pattern {
    NSRange range = [self rangeOfFirstMatchInRegexPattern:pattern];
    return (range.length != NSNotFound && range.length > 0);
}

- (NSString *)stringByReplacingPattern:(NSString *)pattern withTemplate:(NSString *)templ {
    NSRegularExpression *regex = [self regexWithPattern:pattern];
    if (regex) {
        return [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:templ];;
    }
    return self;
}

#pragma mark -

- (NSString*)MD5 {
    if(self == nil || self.length == 0) return nil;
    
    const char *value = self.UTF8String;
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;   
}

- (NSString*)UTF8Encoding {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
}

+ (NSString*)UUID {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *UUID = [NSString stringWithString:(__bridge NSString *) uuidStringRef];
    CFRelease(uuidStringRef);

    return UUID;
}

@end
