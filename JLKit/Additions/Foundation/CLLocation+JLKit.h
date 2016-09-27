//
//  CLLocation+JLKit.h
//  JLKitDemo
//
//  Created by 장석용 on 2016. 9. 27..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <CoreLocation/CLLocation.h>

#define CLLocationCoordinateToDistance(coordinate,toCoordinate) [[CLLocation locationWithCoordinate:coordinate] distanceFromLocation:[CLLocation locationWithCoordinate:toCoordinate]];

@interface CLLocation (JLKit)

+ (CLLocation*)locationWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
