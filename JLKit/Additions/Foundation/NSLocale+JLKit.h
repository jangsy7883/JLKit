//
//  NSLocale+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (Additions)

+ (nullable NSString*)currentLanguageCode;

+ (nullable NSString*)currentCountryCode;

+ (nullable NSString*)languagCodeForLocaleIdentifier:(nullable NSString*)localeIdentifier;

+ (nullable NSString*)displayNameForLanguageCode:(nullable NSString*)languageCode;
+ (nullable NSString*)localizedDisplayNameForLanguageCode:(nullable NSString*)languageCode;

@end
