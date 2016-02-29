//
//  UIView+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewAutoresizingFlexibleSize UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
#define UIViewAutoresizingFlexibleAllMargin UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin

@interface UIView (Additions)

@property (nonatomic, readonly) UIViewController *superViewController;

+ (instancetype)viewWithClass:(Class)viewClass;
+ (instancetype)viewWithNibNamed:(NSString*)nibNameOrNil;

- (void)setTransformScale:(CGFloat)scale;

@end
