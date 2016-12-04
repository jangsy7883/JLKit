//
//  CLLocation+JLKit.h
//  JLKit
//
//  Created by 장석용 on 2016. 9. 27..
//  Copyright © 2016년 Dalkomm. All rights reserved.
//

#import <CoreLocation/CLLocation.h>

#define CLLocationCoordinate2DDistanceTo(coordinate,toCoordinate) [[CLLocation locationWithCoordinate:coordinate] distanceFromLocation:[CLLocation locationWithCoordinate:toCoordinate]];
#define CLLocationCoordinate2DEqualTo(coord1,coord2) (coord1.latitude == coord2.latitude && coord1.longitude == coord2.longitude)

@interface CLLocation (JLKit)

+ (CLLocation*)locationWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
