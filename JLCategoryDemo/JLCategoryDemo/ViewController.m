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
    
    NSLog(@"NSCalendarUnitEra : %ld",(long)[date valueForComponent:NSCalendarUnitEra]);
    NSLog(@"NSCalendarUnitYear : %ld",(long)[date valueForComponent:NSCalendarUnitYear]);
    NSLog(@"NSCalendarUnitMonth : %ld",(long)[date valueForComponent:NSCalendarUnitMonth]);
    NSLog(@"NSCalendarUnitDay : %ld",(long)[date valueForComponent:NSCalendarUnitDay]);
    NSLog(@"NSCalendarUnitHour : %ld",(long)[date valueForComponent:NSCalendarUnitHour]);
    NSLog(@"NSCalendarUnitMinute : %ld",(long)[date valueForComponent:NSCalendarUnitMinute]);
    NSLog(@"NSCalendarUnitSecond : %ld",(long)[date valueForComponent:NSCalendarUnitSecond]);
    NSLog(@"NSCalendarUnitNanosecond : %ld",(long)[date valueForComponent:NSCalendarUnitNanosecond]);
    NSLog(@"NSCalendarUnitWeekday : %ld",(long)[date valueForComponent:NSCalendarUnitWeekday]);
    NSLog(@"NSCalendarUnitWeekdayOrdinal : %ld",(long)[date valueForComponent:NSCalendarUnitWeekdayOrdinal]);
    NSLog(@"NSCalendarUnitQuarter : %ld",(long)[date valueForComponent:NSCalendarUnitQuarter]);
    NSLog(@"NSCalendarUnitWeekOfMonth : %ld",(long)[date valueForComponent:NSCalendarUnitWeekOfMonth]);
    NSLog(@"NSCalendarUnitWeekOfYear : %ld",(long)[date valueForComponent:NSCalendarUnitWeekOfYear]);
    NSLog(@"NSCalendarUnitYearForWeekOfYear : %ld",(long)[date valueForComponent:NSCalendarUnitYearForWeekOfYear]);
    
    
    NSLog(@"NSCalendarUnitYearForWeekOfYear : %@",[date localizedWeekDay]);
    
    NSLog(@"%@",[[NSDate date] dateByAddingCount:-69 forComponent:NSCalendarUnitYear]);
}

@end
