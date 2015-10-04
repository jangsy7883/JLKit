//
//  NSString+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
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

- (NSString*)deleteEmptySpace;
- (NSString*)deleteLineSpace;
- (NSString*)deleteEmptyAndLineSpace;

- (BOOL)startsWith:(NSString *)prefix;
- (BOOL)endWith:(NSString *)prefix;

+ (BOOL)emptyString:(NSString *)parm_string;

- (NSString*)MD5;
- (NSString*)UTF8Encoding;
+ (NSString*)UUID;

@end
