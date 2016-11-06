//
//  NSNumber+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2016. 4. 26..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (JLKit)

- (NSString*)localizedStringForNumberStyle:(NSNumberFormatterStyle)nStyle;
- (NSString *)stringByRounding:(NSNumberFormatterRoundingMode)roundingMode maximumFractionDigits:(NSUInteger)maximumFractionDigits;

@end
