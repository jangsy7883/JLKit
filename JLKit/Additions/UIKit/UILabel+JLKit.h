//
//  UILabel+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

+ (UILabel*)labelWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor;

- (CGSize) fitWithSize:(CGSize)parm_size;
@property (nonatomic, readonly) CGSize fitSize;

@end
