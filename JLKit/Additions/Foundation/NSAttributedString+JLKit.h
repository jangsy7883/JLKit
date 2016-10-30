//
//  NSAttributedString+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 10..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (JLKit)

- (void)addAttributes:(NSDictionary*)attrs text:(NSString*)text;
- (void)appendString:(NSString*)string attributes:(NSDictionary*)attributes;

@end

@interface NSAttributedString (JLKit)

+ (instancetype)attributedString:(NSString*)string attributes:(NSDictionary<NSString *, id> *)attrs;

@end
