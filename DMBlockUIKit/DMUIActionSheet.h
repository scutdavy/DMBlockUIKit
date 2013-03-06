//
//  DMUIActionSheet.h
//  DMBlockUIKit
//
//  Created by 邢大为 on 13-3-6星期三.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMUIBlockType.h"

@interface DMUIActionSheet : NSObject


///-----------------------------------
/// @name Creating action sheets
///-----------------------------------

/** Creates and returns a new action sheet with only a title and cancel button.
 
 @param title The header of the action sheet.
 @return A newly created action sheet.
 */
+ (id)actionSheetWithTitle:(NSString *)title;


///-----------------------------------
/// @name Adding buttons
///-----------------------------------

/** Add a new button with an associated code block.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)addButtonWithTitle:(NSString *)title action:(DMUIBlock)block;

/** Set the destructive (red) button with an associated code block.
 
 @warning Because buttons cannot be removed from an action sheet,
 be aware that the effects of calling this method are cumulative.
 Previously added destructive buttons will become normal buttons.
 
 @param title The text of the button.
 @param block A block of code.
 */
- (void)addDestructiveButtonWithTitle:(NSString *)title action:(DMUIBlock)block;

/** save as UIActionSheet */
- (void)showFromToolbar:(UIToolbar *)view;
- (void)showFromTabBar:(UITabBar *)view;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated NS_AVAILABLE_IOS(3_2);
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated NS_AVAILABLE_IOS(3_2);
- (void)showInView:(UIView *)view;

@end
