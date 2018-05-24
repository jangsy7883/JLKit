//
//  UIView+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewAutoresizingFlexibleSize UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
#define UIViewAutoresizingFlexibleAllMargin UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin

@interface UIView (Additions)

@property (nonatomic, readonly) UIViewController * _Nullable superViewController;
@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, readonly) UIImage* _Nullable screenShot;

+ (instancetype)viewWithClass:(nullable Class)viewClass;
+ (instancetype)viewWithNibNamed:(nullable NSString*)nibNameOrNil;

- (void)setTransformScale:(CGFloat)scale;

- (void)removeAllSubviews;

@end
