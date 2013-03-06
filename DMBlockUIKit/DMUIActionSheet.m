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
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSNumber *destructiveIndex;
@property (nonatomic, strong) UIActionSheet *actionSheet;
@end

@implementation DMUIActionSheet

- (void) dealloc{
    
}

- (instancetype) initWithTitle:(NSString *) title{
    self = [super init];
    if (self == nil) return nil;
    _title = title;
    _titles = @[];
    _actions = @[];
    return self;
}

+ (instancetype) actionSheetWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (void) addButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    NSParameterAssert(title);
    self.titles = [self.titles arrayByAddingObject:title];
    id blockOrNull = [(id)block copy]?: [NSNull null];
    self.actions = [self.actions arrayByAddingObject:blockOrNull];
}

- (void) addButtonWithTitle:(NSString *)title{
    [self addButtonWithTitle:title action:NULL];
}

- (void)addDestructiveButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    [self addButtonWithTitle:title action:block];
    self.destructiveIndex = @( [self.titles count] - 1 );
}

- (const void *) associateKey{
    return "retainKey";
}

- (UIActionSheet *) actionSheet{
    if (_actionSheet == nil){
        _actionSheet = [[UIActionSheet alloc] initWithTitle:self.title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        [self.titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [_actionSheet addButtonWithTitle:obj];
        }];
        if (self.destructiveIndex) {
            _actionSheet.destructiveButtonIndex = [self.destructiveIndex integerValue];
        }
       	objc_setAssociatedObject(_actionSheet, [self associateKey], self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _actionSheet;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    id block = self.actions[buttonIndex];
    if (block != [NSNull null]) {
        ((DMUIBlock)block)();
    }
    objc_removeAssociatedObjects(self.actionSheet);
}

#pragma mark - actionSheet method
- (void)showFromToolbar:(UIToolbar *)view{
    [self.actionSheet showFromToolbar:view];
}
- (void)showFromTabBar:(UITabBar *)view{
    [self.actionSheet showFromTabBar:view];
}
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated NS_AVAILABLE_IOS(3_2){
    [self.actionSheet showFromBarButtonItem:item animated:animated];
}
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated NS_AVAILABLE_IOS(3_2){
    [self.actionSheet showFromRect:rect inView:view animated:animated];
}
- (void)showInView:(UIView *)view{
    [self.actionSheet showInView:view];
}

@end
