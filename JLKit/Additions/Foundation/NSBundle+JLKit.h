//
//  NSBundle+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Additions)

@property (nonatomic, readonly, copy) NSString *appVersion;
@property (nonatomic, readonly, copy) NSString *buildVersion;

- (BOOL)isNewerThenAppVersion:(NSString*)newVersion;

@end
