//
//  NSLocale+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (Additions)

+ (NSString*)currentLanguageCode;

+ (NSString*)currentCountryCode;

+ (NSString*)languagCodeForLocaleIdentifier:(NSString*)localeIdentifier;

@end
