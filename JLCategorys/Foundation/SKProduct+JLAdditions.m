//
//  SKProduct+JLAdditions.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2016. 2. 29..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "SKProduct+JLAdditions.h"

@implementation SKProduct (JLAdditions)

- (NSString*)currencyPrice
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.formatterBehavior = NSNumberFormatterBehavior10_4;
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.locale = self.priceLocale;
    
    return [formatter stringFromNumber:self.price];
}

@end
