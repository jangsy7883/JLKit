//
//  UILabel+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "UILabel+JLAdditions.h"

@implementation UILabel (Additions)

+ (UILabel*)labelWithText:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor
{
    UILabel* label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    return label;
}

- (CGSize)fitWithSize:(CGSize)parm_size
{
    CGSize size = CGSizeZero;
    
    if ([self.attributedText length] > 0)
    {
        size = [self.attributedText boundingRectWithSize:parm_size
                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                                 context:nil].size;
    }
    else if ([self.text length] > 0)
    {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.alignment = self.textAlignment;
        paragraphStyle.lineBreakMode = self.lineBreakMode;
        
        size = [self.text boundingRectWithSize:parm_size
                                       options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                    attributes:@{
                                                 NSFontAttributeName:self.font,
                                                 NSParagraphStyleAttributeName:paragraphStyle
                                                 }
                                       context:nil].size;
    }
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

- (CGSize)fitSize
{
    return [self fitWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}


@end
