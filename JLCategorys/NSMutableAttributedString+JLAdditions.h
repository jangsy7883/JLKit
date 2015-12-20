//
//  NSMutableAttributedString+JLAdditions.h
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 12. 10..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (JLAdditions)

- (void)addAttributes:(NSDictionary*)attrs text:(NSString*)text;

@end
