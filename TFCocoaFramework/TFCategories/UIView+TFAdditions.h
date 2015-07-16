//
//  UIView+TFAdditions.h
//  TFCocoaFramework
//
//  Created by Melvin on 7/14/15.
//  Copyright © 2015 TimeFace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TFAdditions)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = tfLeft
 */
@property (nonatomic) CGFloat tfLeft;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = tfTop
 */
@property (nonatomic) CGFloat tfTop;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = tfRight - frame.size.width
 */
@property (nonatomic) CGFloat tfRight;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = tfBottom - frame.size.height
 */
@property (nonatomic) CGFloat tfBottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = tfWidth
 */
@property (nonatomic) CGFloat tfWidth;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = tfHeight
 */
@property (nonatomic) CGFloat tfHeight;

/**
 * Shortcut for center.x
 *
 * Sets center.x = tfCenterX
 */
@property (nonatomic) CGFloat tfCenterX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = tfCenterY
 */
@property (nonatomic) CGFloat tfCenterY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat tfScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat tfScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat tfScreenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat tfScreenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect tfScreenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint tfOrigin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize tfSize;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat tfOrientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat tfOrientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;


@end
