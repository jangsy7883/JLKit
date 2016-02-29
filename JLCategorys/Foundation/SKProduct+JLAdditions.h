//
//  SKProduct+JLAdditions.h
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2016. 2. 29..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKProduct (JLAdditions)

@property (nonatomic, readonly) NSString *currencyPrice;

@end
