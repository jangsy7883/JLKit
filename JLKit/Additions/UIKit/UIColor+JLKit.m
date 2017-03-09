//
//  UIColor+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 12. 7. 15..
//  Copyright © 2012년 Dalkomm All rights reserved.
//

#import "UIColor+JLKit.h"

@implementation UIColor (Additions)

+ (UIColor*)colorWithHex:(NSString*)hex {
    return [UIColor colorWithHex:hex alpha:1.0];
}

+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha {
    if (hex == nil || [hex isKindOfClass:[NSString class]] == NO || hex.length == 0) {
        return nil;
    }
    
    NSString *colorString = [[hex stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];

    unsigned (^colorComponentFrom)(NSInteger, NSInteger) = ^(NSInteger start, NSInteger length) {
        NSString *substring = [colorString substringWithRange: NSMakeRange(start, length)];
        NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
        unsigned hexComponent;
        [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
        return hexComponent;
    };
    
    switch (colorString.length) {
        case 3: // #RGB
            return RGBA(colorComponentFrom(0,1), colorComponentFrom(1,1), colorComponentFrom(2,1), alpha);
            break;
        case 4: // #ARGB
            return RGBA(colorComponentFrom(1,1), colorComponentFrom(2,1), colorComponentFrom(3,1), colorComponentFrom(0,1));
            break;
        case 6: // #RRGGBB
            return RGBA(colorComponentFrom(0,2), colorComponentFrom(2,2), colorComponentFrom(4,2), alpha);
            break;
        case 8: // #AARRGGBB
            return RGBA(colorComponentFrom(2,2), colorComponentFrom(4,2), colorComponentFrom(6,2), colorComponentFrom(0,2));
            break;
        default:
            return [UIColor whiteColor];
            break;
    }
 
 /*
    if(colorString.length == 3) {
        colorString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [colorString substringWithRange:NSMakeRange(0, 1)],[colorString substringWithRange:NSMakeRange(0, 1)],
                       [colorString substringWithRange:NSMakeRange(1, 1)],[colorString substringWithRange:NSMakeRange(1, 1)],
                       [colorString substringWithRange:NSMakeRange(2, 1)],[colorString substringWithRange:NSMakeRange(2, 1)]];
    }
    if(colorString.length == 6) {
        colorString = [colorString stringByAppendingString:@"ff"];
    }

    unsigned int baseValue;
    [[NSScanner scannerWithString:colorString] scanHexInt:&baseValue];
    
    return RGBA(((baseValue >> 24) & 0xFF), ((baseValue >> 16) & 0xFF), ((baseValue >> 8) & 0xFF), alpha);
    */
}

+ (BOOL)isValidHex:(NSString*)hex {
    
    if (hex == nil || [hex isKindOfClass:[NSString class]] == NO || hex.length == 0) {
        return NO;
    }
    
    NSString *colorString = [[hex stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    
    if (colorString) {
        if (colorString.length == 3 || colorString.length == 4 || colorString.length == 6 || colorString.length == 8) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isEqualToColor:(UIColor *)color {
    if (self == color) return YES;
    
    CGColorSpaceRef colorSpaceRGB = CGColorSpaceCreateDeviceRGB();
    
    UIColor *(^convertColorToRGBSpace)(UIColor*) = ^(UIColor *color) {
        if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) == kCGColorSpaceModelMonochrome) {
            const CGFloat *oldComponents = CGColorGetComponents(color.CGColor);
            CGFloat components[4] = {oldComponents[0], oldComponents[0], oldComponents[0], oldComponents[1]};
            CGColorRef colorRef = CGColorCreate(colorSpaceRGB, components);
            UIColor *color = [UIColor colorWithCGColor:colorRef];
            CGColorRelease(colorRef);
            return color;
        }
        else {
            return color;
        }
    };
    
    UIColor *selfColor = convertColorToRGBSpace(self);
    color = convertColorToRGBSpace(color);
    CGColorSpaceRelease(colorSpaceRGB);
    
    return [selfColor isEqual:color];
}

- (UIColor *)lighterColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.3, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor*) darkerColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.75
                               alpha:a];
    return nil;
}

+ (UIColor*)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}

@end
