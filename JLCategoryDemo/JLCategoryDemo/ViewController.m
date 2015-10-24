//
//  ViewController.m
//  JLCategoryDemo
//
//  Created by IM049 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "ViewController.h"
#import "JLCategorysHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[UIFont systemFontOfSize:12].fontName);
    
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleRegular].fontName);
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleLight].fontName);
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleMedium].fontName);
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleSemibold].fontName);
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleBold].fontName);
    NSLog(@"%@",[UIFont systemFontOfSize:12 style:UIFontStyleHeavy].fontName);
    
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightUltraLight].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightThin].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightLight].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightRegular].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightMedium].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightSemibold].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightBold].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightHeavy].fontName);
//    NSLog(@"%@",[UIFont systemFontOfSize:12 weight:UIFontWeightBlack].fontName);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
