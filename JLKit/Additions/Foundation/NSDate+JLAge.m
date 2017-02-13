//
//  NSDate+JLAge.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 23..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDate+JLAge.h"


@implementation NSDate (JLAge)

- (NSInteger)age {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                 fromDate:self];
    NSDateComponents *toComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                   fromDate:[NSDate date]];

    NSInteger year = toComponents.year - components.year;
    
    toComponents.year = components.year;
    
    if([components.date compare:toComponents.date] == NSOrderedAscending) {
        return MAX(1, year) - 1;
    }
    else {
        return MAX(0, year);
    }
}

- (NSInteger)koreanAge {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                                   fromDate:self];
    NSDateComponents *toComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                                     fromDate:[NSDate date]];
    
    NSInteger year = toComponents.year - components.year;
    
    toComponents.year = components.year;
    
    return MAX(0, year) + 1;
}

@end
