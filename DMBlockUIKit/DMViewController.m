//
//  DMViewController.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMViewController.h"
#import "DMUIAlertView.h"
#import "DMUIActionSheet.h"

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
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"actionSheet" forState:UIControlStateNormal];
    [button1 sizeToFit];
    [button1 addTarget:self action:@selector(actionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    button1.frame = CGRectMake(100, 100, CGRectGetWidth(button1.frame), CGRectGetHeight(button1.frame));
    
}

- (void) action{
    DMUIAlertView *alert = [DMUIAlertView alertViewWithTitle:@"title" message:@"message"];
    [alert addButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    
    [alert addButtonWithTitle:@"button2"];
    [alert show];
}

- (void) actionSheet{
   DMUIActionSheet *sheet = [DMUIActionSheet actionSheetWithTitle:@"title"];
    [sheet addButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    [sheet addButtonWithTitle:@"button2" action:^{
        NSLog(@"button2");
    }];
    [sheet addButtonWithTitle:@"button3" action:^{
        NSLog(@"button3");
    }];
    [sheet addButtonWithTitle:@"title4" action:NULL];
    [sheet addDestructiveButtonWithTitle:@"cancel" action:^{
        NSLog(@"cancel");
    }];
   [sheet showInView:self.view];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
