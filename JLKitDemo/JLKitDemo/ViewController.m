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
    
    

    
    NSLog(@"%@",[NSMutableAttributedString attributedString:@"aaa" attributes:@{
                                                                                NSFontAttributeName:Font_Light(12)
                                                                                }]);
    
    NSLog(@"%@",[NSAttributedString attributedString:@"aaa" attributes:@{
                                                                         NSFontAttributeName:Font_Light(12)
                                                                         }]);
    
}

@end
