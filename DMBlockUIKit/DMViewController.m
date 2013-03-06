//
//  DMViewController.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMViewController.h"
#import "DMAlertView.h"

@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"alertView" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void) action{
    DMAlertView *alert = [DMAlertView alertViewWithTitle:@"title" message:@"message"];
    [alert addButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    
    [alert addButtonWithTitle:@"button2"];
    [alert show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
