//
//  DMAlertView.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMUIAlertView.h"
#import <objc/runtime.h>

@interface DMUIAlertView ()<UIAlertViewDelegate>
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, strong) UIAlertView *alertView;
@end

@implementation DMUIAlertView

- (void) dealloc{
    
}

- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message{
    self = [super init];
    if (self == nil) return nil;
    _actions = @[];
    _alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    return self;
}

+ (instancetype) alertViewWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title message:nil];
}

+ (instancetype) alertViewWithTitle:(NSString *)title message:(NSString *)message{
    return [[self alloc] initWithTitle:title message:message];
}

- (void)addButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    NSParameterAssert(title);
    
    [self.alertView addButtonWithTitle:title];
    id blockOrNull = [block copy] ?: [NSNull null];
    self.actions = [self.actions arrayByAddingObject:blockOrNull];
    
}

- (void) addButtonWithTitle:(NSString *)title{
    [self addButtonWithTitle:title action:NULL];
}

- (const void *) associateKey{
    return "retainKey";
}

- (void) show{
    [self addRetainCircle];
    [self.alertView show];
}

- (void) addRetainCircle{
	objc_setAssociatedObject(self.alertView, [self associateKey], self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) breakCircle{
    self.alertView = nil;
}

#pragma mark - delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    id block = self.actions[buttonIndex];
    if (block != [NSNull null]) {
        ((DMUIBlock)block)();
    }
    [self breakCircle];
}

- (void) alertViewCancel:(UIAlertView *)alertView{
    [self breakCircle];
}

@end
