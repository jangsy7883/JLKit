//
//  CLLocation+JLKit.m
//  JLKitDemo
//
//  Created by 장석용 on 2016. 9. 27..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import "CLLocation+JLKit.h"

@implementation CLLocation (JLKit)

+ (CLLocation*)locationWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    return [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}

@end
