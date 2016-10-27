//
//  NSURL+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 8..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (JLKit)

@property (nonatomic, readonly, copy) NSDictionary * queryParameters;

+ (instancetype)URLWithString:(NSString*)baseURL parameters:(NSDictionary*)parameters;

@end
