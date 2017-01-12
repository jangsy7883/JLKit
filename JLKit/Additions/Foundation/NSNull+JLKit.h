//
//  NSNull+JLKit.h
//  JLKit
//
//  Created by Woody on 2017. 1. 12..
//  Copyright © 2017년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (JLKit)

#pragma mark *** Extracting numeric values ***

@property (readonly) double doubleValue;
@property (readonly) float floatValue;
@property (readonly) int intValue;
@property (readonly) NSInteger integerValue;
@property (readonly) BOOL boolValue;

@end
