//
//  UIColor+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 12. 7. 15..
//  Copyright © 2012년 Dalkomm All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HEX(code) [UIColor colorWithHex:code]
#define HEXA(code,a) [UIColor colorWithHex:code alpha:a]

@interface UIColor (Additions)

/** colorWithHex:
 * 컬러코드를 통해 RGB컬러값을 가져온다
 * @param hex String형의 컬러코드
 * @return 입력된 컬러코드에 대한 RGB컬러값
 * @date 2012.07.31
 * @author Jangsy7883,
 */
+ (UIColor*)colorWithHex:(NSString*)hex;

/** colorWithHex:alpha:
 * 컬러코드와 alpha값을 통해 RGB컬러값을 가져온다
 * @param hex String형의 컬러코드
 * @param alpha 해당 컬러의 alpha값
 * @return 입력된 컬러코드에 대한 RGB컬러값
 * @date 2012.07.31
 * @author Jangsy7883,
 */
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;

+ (BOOL)isValidHex:(NSString*)hex;

- (BOOL)isEqualToColor:(UIColor *)color;

@property (nonatomic, readonly, copy) UIColor *lighterColor;
@property (nonatomic, readonly, copy) UIColor *darkerColor;

+ (UIColor*)randomColor;
@end
