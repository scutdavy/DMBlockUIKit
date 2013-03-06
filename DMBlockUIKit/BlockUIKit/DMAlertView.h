//
//  DMAlertView.h
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DMBlock)(void); // compatible with dispatch_block_t


@interface DMAlertView : NSObject
/** Creates and returns a new alert view with only a title and cancel button.
 
 @param title The title of the alert view.
 @return A newly created alert view.
 */
+ (instancetype)alertViewWithTitle:(NSString *)title;

/** Creates and returns a new alert view with only a title, message, and cancel button.
 
 @param title The title of the alert view.
 @param message The message content of the alert.
 @return A newly created alert view.
 */
+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message;

/** Add a new button with an associated code block.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)addButtonWithTitle:(NSString *)title action:(DMBlock)block;


/** show alert view
 */
- (void) show;

@end
