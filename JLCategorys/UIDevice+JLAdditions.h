//
//  UIDevice+IdentifierAddition.h
//  JLCategory
//
//  Created by jang_sy on 11. 9. 5..
//  Copyright 2011년 Aurora Apps. All rights reserved.
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

/**
 * 해당 단말기의 iOS 버전과 전달받은 버전을 비교한다.
 * 단말기의 버전정보가 전달받은 버전정보 보다 높으면 YES를 반환한다.
 * @method compareSystemVersion:
 * @param compare 비교하기 위한 iOS버전
 * @return 전달받은 버전정보와 단말기의 버전정보 비교 결과
 * @date 2012.02.06
 * @author Jang_sy,
 */
- (BOOL)compareSystemVersion:(CGFloat)compare;

@end
