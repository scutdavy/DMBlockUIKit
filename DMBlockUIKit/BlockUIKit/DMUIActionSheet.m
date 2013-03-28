//
//  DMUIActionSheet.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "DMUIActionSheet.h"
#import <objc/runtime.h>

@interface DMUIActionSheet ()<UIActionSheetDelegate>
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@end

@implementation DMUIActionSheet

- (void) dealloc{
    
}

- (instancetype) initWithTitle:(NSString *) title{
    self = [super init];
    if (self == nil) return nil;
    _actions = @[];
    _actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    return self;
}

+ (instancetype) actionSheetWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (void) addButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    NSParameterAssert(title);
    [self.actionSheet addButtonWithTitle:title];
    id blockOrNull = [(id)block copy]?: [NSNull null];
    self.actions = [self.actions arrayByAddingObject:blockOrNull];
}

- (void) addButtonWithTitle:(NSString *)title{
    [self addButtonWithTitle:title action:NULL];
}

- (void)addDestructiveButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    [self addButtonWithTitle:title action:block];
    self.actionSheet.destructiveButtonIndex = [self.actions count] - 1;
}

- (const void *) associateKey{
    return "retainKey";
}

#pragma mark - delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSParameterAssert(buttonIndex < [self.actions count]);
    if (buttonIndex >= [self.actions count]) return;
    
    id block = self.actions[buttonIndex];
    if (block != [NSNull null]) {
        ((DMUIBlock)block)();
    }
    [self breakRetainCircle];
}

- (void) actionSheetCancel:(UIActionSheet *)actionSheet{
    [self breakRetainCircle];
}

- (void) addRetainCircle{
    objc_setAssociatedObject(_actionSheet, [self associateKey], self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) breakRetainCircle{
    self.actionSheet = nil;
}

#pragma mark - actionSheet method
- (void)showFromToolbar:(UIToolbar *)view{
    [self addRetainCircle];
    [self.actionSheet showFromToolbar:view];
}
- (void)showFromTabBar:(UITabBar *)view{
    [self addRetainCircle];
    [self.actionSheet showFromTabBar:view];
}
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated NS_AVAILABLE_IOS(3_2){
    [self addRetainCircle];
    [self.actionSheet showFromBarButtonItem:item animated:animated];
}
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated NS_AVAILABLE_IOS(3_2){
    [self addRetainCircle];
    [self.actionSheet showFromRect:rect inView:view animated:animated];
}
- (void)showInView:(UIView *)view{
    [self addRetainCircle];
    [self.actionSheet showInView:view];
}

@end
