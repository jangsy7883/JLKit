//
//  ViewController.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "ViewController.h"
#import "JLKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[[NSDate date] dateByAddingCount:1 forComponent:NSCalendarUnitDay]);
    
    NSLog(@"WiFi : %@",[[UIDevice currentDevice] ipAddressForWiFi]);
    NSLog(@"Cellular : %@",[[UIDevice currentDevice] ipAddressForCellular]);
    
    
    NSURL *url = [NSURL URLWithString:@"http://wwww.naver.com" parameters:@{
                                                                            @"A":@"서울역",
                                                                            @"B":@(1),
                                                                            }];
    NSLog(@"%@",url);
    NSLog(@"%@",[url parameters]);
}

@end
