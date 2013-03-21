//
//  UIActionSheet+DMUIBlockKit.h
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-18星期一.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMUIBlockType.h"

@interface UIActionSheet (DMUIBlockKit)

///-----------------------------------
/// @name Creating action sheets
///-----------------------------------

/** Creates and returns a new action sheet with only a title and cancel button.
 
 @param title The header of the action sheet.
 @return A newly created action sheet.
 */
+ (instancetype)DMUIActionSheetWithTitle:(NSString *)title;


///-----------------------------------
/// @name Adding buttons
///-----------------------------------

/** Add a new button with an associated code block.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)DMUIAddButtonWithTitle:(NSString *)title action:(DMUIBlock)block;


/** add button without action */
- (void) DMUIAddButtonWithTitle:(NSString *)title;


/** Set the destructive (red) button with an associated code block.
 
 @warning Because buttons cannot be removed from an action sheet,
 be aware that the effects of calling this method are cumulative.
 Previously added destructive buttons will become normal buttons.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)DMUIAddDestructiveButtonWithTitle:(NSString *)title action:(DMUIBlock)block;

@end
