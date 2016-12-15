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

    
    
    
    
    NSString *com = @"31, 32, 41, 38,35";
    

    NSArray *arrau = [com componentsSeparatedByString:@"," componentBlock:^id(id component) {
        if ([component isKindOfClass:[NSString class]])
        {
            return [component deleteEmptySpace];
        }
        return component;
    }];
    
    NSLog(@"%@",arrau);
    
}

@end
