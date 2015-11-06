//
//  UILabel+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

+ (UILabel*)labelWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor;

- (CGSize) fitWithSize:(CGSize)parm_size;
- (CGSize) fitSize;

@end
