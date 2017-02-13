//
//  NSLocale+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSLocale+JLKit.h"

@implementation NSLocale (Additions)

+ (NSString*)currentLanguageCode {
    return [self languagCodeForLocaleIdentifier:[NSLocale preferredLanguages].firstObject];
}

+ (NSString*)currentCountryCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

+ (NSString*)languagCodeForLocaleIdentifier:(NSString*)localeIdentifier {
    NSLocale *local = [[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier];
    NSString *languageCode = [local objectForKey:NSLocaleLanguageCode];
    NSString *scriptCode = [local objectForKey:NSLocaleScriptCode];
    
    if (scriptCode != nil) {
        languageCode = [languageCode stringByAppendingString:[NSString stringWithFormat:@"-%@",scriptCode]];
    }
    
    return languageCode;
}

+ (NSString*)displayNameForLanguageCode:(NSString*)languageCode {
    return [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:languageCode];
}

+ (NSString*)localizedDisplayNameForLanguageCode:(NSString*)languageCode {
    return [[[NSLocale alloc] initWithLocaleIdentifier:languageCode] displayNameForKey:NSLocaleLanguageCode
                                                                                 value:languageCode];
}

@end
