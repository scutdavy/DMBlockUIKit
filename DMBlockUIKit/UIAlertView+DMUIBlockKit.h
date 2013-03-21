//
//  UIAlertView+DMUIBlockKit.h
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-21星期四.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMUIBlockType.h"

@interface UIAlertView (DMUIBlockKit)

/** Creates and returns a new alert view with only a title and cancel button.
 
 @param title The title of the alert view.
 @return A newly created alert view.
 */
+ (instancetype)DMUIAlertViewWithTitle:(NSString *)title;

/** Creates and returns a new alert view with only a title, message, and cancel button.
 
 @param title The title of the alert view.
 @param message The message content of the alert.
 @return A newly created alert view.
 */
+ (instancetype)DMUIAlertViewWithTitle:(NSString *)title message:(NSString *)message;

/** Add a new button with an associated code block.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)DMUIAddButtonWithTitle:(NSString *)title action:(DMUIBlock)block;

/** Add a new Button without block */

- (void) DMUIAddButtonWithTitle:(NSString *)title;

@end
