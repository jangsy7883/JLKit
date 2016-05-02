//
//  NSNumber+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2016. 4. 26..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "NSNumber+JLKit.h"

@implementation NSNumber (JLKit)

- (NSString*)localizedStringForNumberStyle:(NSNumberFormatterStyle)nStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self
                                            numberStyle:nStyle];
}

@end
