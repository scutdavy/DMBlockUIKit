//
//  UIAlertView+DMUIBlockKit.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-21星期四.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "UIAlertView+DMUIBlockKit.h"
#import <objc/runtime.h>

@implementation UIAlertView (DMUIBlockKit)

- (void) dealloc{
    
}

+ (instancetype) DMUIAlertViewWithTitle:(NSString *)title{
    return [self DMUIAlertViewWithTitle:title message:nil];
}

+ (instancetype) DMUIAlertViewWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    alert.delegate = alert;
    return alert;
}

- (void)DMUIAddButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    NSParameterAssert(title);
    
    [self addButtonWithTitle:title];
    id blockOrNull = [block copy] ?: [NSNull null];
    [[self actions] addObject:blockOrNull];
}

- (void) DMUIAddButtonWithTitle:(NSString *)title{
    [self DMUIAddButtonWithTitle:title action:NULL];
}

- (char *) actionsKey{
    return "actionKeys";
}

- (NSMutableArray *) actions{
    NSMutableArray *actions = objc_getAssociatedObject(self, [self actionsKey]);
    if (actions == nil){
        actions = [NSMutableArray array];
        objc_setAssociatedObject(self, [self actionsKey], actions, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(actions, [self actionsKey], self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return actions;
}

#pragma mark - delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    id block = self.actions[buttonIndex];
    if (block != [NSNull null]) {
        ((DMUIBlock)block)();
    }
    [self breakRetainCircle];
}

- (void) alertViewCancel:(UIAlertView *)alertView{
    [self breakRetainCircle];
}

- (void) breakRetainCircle{
    objc_removeAssociatedObjects(self);
}



@end
