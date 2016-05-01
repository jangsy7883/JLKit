//
//  ViewController.m
//  JLCategoryDemo
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "ViewController.h"
#import "JLCategorys.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSDate *date = [NSDate date];
    
    NSLog(@"NSCalendarUnitEra : %ld",(long)[date valueForUnit:NSCalendarUnitEra]);
    NSLog(@"NSCalendarUnitYear : %ld",(long)[date valueForUnit:NSCalendarUnitYear]);
    NSLog(@"NSCalendarUnitMonth : %ld",(long)[date valueForUnit:NSCalendarUnitMonth]);
    NSLog(@"NSCalendarUnitDay : %ld",(long)[date valueForUnit:NSCalendarUnitDay]);
    NSLog(@"NSCalendarUnitHour : %ld",(long)[date valueForUnit:NSCalendarUnitHour]);
    NSLog(@"NSCalendarUnitMinute : %ld",(long)[date valueForUnit:NSCalendarUnitMinute]);
    NSLog(@"NSCalendarUnitSecond : %ld",(long)[date valueForUnit:NSCalendarUnitSecond]);
    NSLog(@"NSCalendarUnitNanosecond : %ld",(long)[date valueForUnit:NSCalendarUnitNanosecond]);
    NSLog(@"NSCalendarUnitWeekday : %ld",(long)[date valueForUnit:NSCalendarUnitWeekday]);
    NSLog(@"NSCalendarUnitWeekdayOrdinal : %ld",(long)[date valueForUnit:NSCalendarUnitWeekdayOrdinal]);
    NSLog(@"NSCalendarUnitQuarter : %ld",(long)[date valueForUnit:NSCalendarUnitQuarter]);
    NSLog(@"NSCalendarUnitWeekOfMonth : %ld",(long)[date valueForUnit:NSCalendarUnitWeekOfMonth]);
    NSLog(@"NSCalendarUnitWeekOfYear : %ld",(long)[date valueForUnit:NSCalendarUnitWeekOfYear]);
    NSLog(@"NSCalendarUnitYearForWeekOfYear : %ld",(long)[date valueForUnit:NSCalendarUnitYearForWeekOfYear]);
    
    
    NSLog(@"NSCalendarUnitYearForWeekOfYear : %@",[date localizedWeekDay]);
    
    NSLog(@"%@",[[NSDate date] dateByAddingCount:-69 forUnit:NSCalendarUnitYear]);
}

@end
