//
//  NSNumber+JLAdditions.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2016. 4. 26..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "NSNumber+JLAdditions.h"

@implementation NSNumber (JLAdditions)

- (NSString*)localizedStringForNumberStyle:(NSNumberFormatterStyle)nStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self
                                            numberStyle:nStyle];
}

@end
