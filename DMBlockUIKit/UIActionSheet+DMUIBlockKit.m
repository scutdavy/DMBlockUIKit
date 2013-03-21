//
//  UIActionSheet+DMUIBlockKit.m
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-18星期一.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "UIActionSheet+DMUIBlockKit.h"
#import <objc/runtime.h>

@interface UIActionSheet ()<UIActionSheetDelegate>
@end

@implementation UIActionSheet (DMUIBlockKit)

- (void) dealloc{
    
}

+ (id)DMUIActionSheetWithTitle:(NSString *)title{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    sheet.delegate = sheet;
    return sheet;
}

- (void)DMUIAddButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    NSParameterAssert(title);
    [self addButtonWithTitle:title];
    id blockOrNull = [(id)block copy]?: [NSNull null];
    [[self actions] addObject:blockOrNull];
}

- (void) DMUIAddButtonWithTitle:(NSString *)title{
    [self DMUIAddButtonWithTitle:title action:NULL];
}

- (void)DMUIAddDestructiveButtonWithTitle:(NSString *)title action:(DMUIBlock)block{
    [self DMUIAddButtonWithTitle:title action:block];
    self.destructiveButtonIndex = [[self actions] count] - 1;
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

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    id block = self.actions[buttonIndex];
    if (block != [NSNull null]) {
        ((DMUIBlock)block)();
    }
    [self breakRetainCircle];
}

- (void) actionSheetCancel:(UIActionSheet *)actionSheet{
    [self breakRetainCircle];
}

- (void) breakRetainCircle{
    objc_removeAssociatedObjects(self);
}

@end
