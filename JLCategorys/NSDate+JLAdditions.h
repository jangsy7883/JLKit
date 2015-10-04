//
//  NSDate+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString timeZone:(NSString*)timeZone;
+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString;

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat timeZone:(NSString*)parm_timeZone;
- (NSString*)stringFromFormat:(NSString*)parm_stringFormat;

@end
