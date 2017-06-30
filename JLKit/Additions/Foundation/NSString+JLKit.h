//
//  NSString+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NSStringFromBool(b) b ? @"Y":@"N"
#define NSStringFromInteger(i) [@(i) stringValue]
#define NSStringFromNumber(i) [i stringValue]
#define NSStringFromObject(object) [object isKindOfClass:[NSString class]] ? object : ([object isKindOfClass:[NSNumber class]] ? [object stringValue] : [object description])

@interface NSString (Additions)

- (CGSize)sizeWithFont:(UIFont*)font
     constrainedToSize:(CGSize)size
             alignment:(NSTextAlignment)alignment
         lineBreakMode:(NSLineBreakMode)lineBreakMode;

@property (nonatomic, readonly, copy) NSString *deleteEmptySpace;
@property (nonatomic, readonly, copy) NSString *deleteLineSpace;
@property (nonatomic, readonly, copy) NSString *deleteEmptyAndLineSpace;

- (BOOL)startsWith:(NSString *)prefix;
- (BOOL)endWith:(NSString *)prefix;

+ (BOOL)emptyString:(NSString *)parm_string;

- (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator componentBlock:(id (^)(id component))block;

- (NSString *)stringByAppendingPathComponents:(NSArray <NSString *>*)pathComponents;

- (NSRange)rangeOfFirstMatchInRegexPattern:(NSString*)pattern;
- (NSArray<NSTextCheckingResult *> *)matchesInRegexPattern:(NSString*)pattern;
- (BOOL)isValidInRegexPattern:(NSString*)pattern;

- (NSString *)stringByReplacingPattern:(NSString *)pattern withTemplate:(NSString *)templ;

@property (nonatomic, readonly, copy) NSString *MD5;
@property (nonatomic, readonly, copy) NSString *UTF8Encoding;

+ (NSString*)UUID;

@end
