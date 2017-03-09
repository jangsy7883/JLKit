//
//  NSNumber+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2016. 4. 26..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "NSNumber+JLKit.h"
#include <stdlib.h>

@implementation NSNumber (JLKit)

- (NSString*)localizedStringForNumberStyle:(NSNumberFormatterStyle)nStyle {
    return [NSNumberFormatter localizedStringFromNumber:self
                                            numberStyle:nStyle];
}

- (NSString *)stringByRounding:(NSNumberFormatterRoundingMode)roundingMode maximumFractionDigits:(NSUInteger)maximumFractionDigits {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:maximumFractionDigits];
    [formatter setRoundingMode:roundingMode];
    NSString *numberString = [formatter stringFromNumber:self];
    return numberString;
}

+ (NSInteger)randomIntegerWithMin:(NSInteger)min max:(NSInteger)max {
    NSInteger form = max - min + 1;
    return (NSInteger)(min + arc4random_uniform((uint32_t)form));
}

@end
