//
//  DMViewController.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMViewController.h"
#import "DMUIAlertView.h"
#import "UIActionSheet+DMUIBlockKit.h"

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
   UIActionSheet *sheet = [UIActionSheet DMUIActionSheetWithTitle:@"title"];
    [sheet DMUIAddButtonWithTitle:@"button1" action:^{
        [self log:@"button1"];
    }];
    [sheet DMUIAddButtonWithTitle:@"button2" action:^{
        NSLog(@"button2");
    }];
    [sheet DMUIAddButtonWithTitle:@"button3" action:^{
        NSLog(@"button3");
    }];
    [sheet DMUIAddButtonWithTitle:@"button4"];
    [sheet DMUIAddDestructiveButtonWithTitle:@"cancel" action:^{
        NSLog(@"cancel");
    }];
   [sheet showInView:self.view];
}

- (void) log:(NSString *) msg{
    NSLog(@"%@", msg);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
