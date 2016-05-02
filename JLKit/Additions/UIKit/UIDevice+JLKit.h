//
//  UIDevice+IdentifierAddition.h
//  JLKit
//
//  Created by Jangsy7883 on 11. 9. 5..
//  Copyright © 2012년 Dalkomm Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define OS_VERSION              [[UIDevice currentDevice].systemVersion floatValue]
#define OS_VERSION_COMPARE(v)   [[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]

#define OS_VERSION_EQUAL_TO(v)                  (OS_VERSION_COMPARE(v) == NSOrderedSame)
#define OS_VERSION_GREATER_THAN(v)              (OS_VERSION_COMPARE(v) == NSOrderedDescending)
#define OS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  (OS_VERSION_COMPARE(v) != NSOrderedAscending)
#define OS_VERSION_LESS_THAN(v)                 (OS_VERSION_COMPARE(v) == NSOrderedAscending)
#define OS_VERSION_LESS_THAN_OR_EQUAL_TO(v)     (OS_VERSION_COMPARE(v) != NSOrderedDescending)

#define SYSTEM_VER [[UIDevice currentDevice] systemVersion]

@interface UIDevice (Additions)

@property (nonatomic, readonly , assign) unsigned long long systemTotalSize; //단말기의 총 용량
@property (nonatomic, readonly , assign) unsigned long long systemFreeSize; //단말기의 사용 가능한 용량

@property (nonatomic, readonly ,  strong) NSString* ipAddressForCellular; //IP Address
@property (nonatomic, readonly ,  strong) NSString* ipAddressForWiFi; //연결된 WiFi의 IP Address

@end
