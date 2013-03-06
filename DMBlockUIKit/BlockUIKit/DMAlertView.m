//
//  DMAlertView.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMAlertView.h"
#import <objc/runtime.h>

@interface DMAlertView ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *message;
@property (nonatomic, strong) UIAlertView *alertView;
@end

@implementation DMAlertView

- (void) dealloc{
    
}

- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message{
    self = [super init];
    if (self == nil) return nil;
    _title = title;
    _message = message;
    _titles = @[];
    _actions = @[];
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
    
    self.titles = [self.titles arrayByAddingObject:title];
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
    self.alertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [self.titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.alertView addButtonWithTitle:obj];
    }];
	objc_setAssociatedObject(self.alertView, [self associateKey], self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    DMUIBlock block = self.actions[buttonIndex];
    if (![(id)block isKindOfClass:[NSNull class]]) {
        block();
    }
    objc_removeAssociatedObjects(self.alertView);
}
@end
