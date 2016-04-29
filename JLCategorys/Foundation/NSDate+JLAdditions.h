//
//  NSDate+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

@property (nonatomic, readonly, getter=isToday) BOOL today;

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString withTimeZone:(NSTimeZone*)timeZone;
+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString;

- (NSString*)stringFromFormat:(NSString*)stringFormat withTimeZone:(NSTimeZone*)timeZone;
- (NSString*)stringFromFormat:(NSString*)stringFormat;

- (BOOL)isEqualDayToDate:(NSDate *)date;

- (NSInteger)valueForUnit:(NSCalendarUnit)unit;
- (NSDate*)dateByAddingCount:(NSInteger)count forUnit:(NSCalendarUnit)unit;

@end
