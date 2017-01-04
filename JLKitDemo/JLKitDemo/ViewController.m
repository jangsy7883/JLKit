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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(IBAction)pressedButton:(id)sender
{
    
}

-(IBAction)pressedButton1:(id)sender
{
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(pressedButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSLog(@"1 %@",[button actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]);
    
    [button addTarget:self action:@selector(pressedButton:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(pressedButton1:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"2 %@",[button actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]);
    
    [button removeTarget:self action:nil forControlEvents:UIControlEventTouchUpOutside];
    
    NSLog(@"2 %@",[button actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]);
    
}

@end
