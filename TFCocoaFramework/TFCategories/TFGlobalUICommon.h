//
//  TFGlobalUICommon.h
//  TFCocoaFramework
//
//  Created by Melvin on 7/14/15.
//  Copyright © 2015 TimeFace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

CGRect TFScreenBounds(void);
CGSize TFScreenSize(void);


/**
 * @return the current runtime version of the iPhone OS.
 */
float TFOSVersion(void);

/**
 * Checks if the run-time version of the OS is at least a certain version.
 */
BOOL TFRuntimeOSVersionIsAtLeast(float version);

/**
 * @return TRUE if the device has phone capabilities.
 */
BOOL TFIsPhoneSupported(void);

/**
 * @return TRUE if the device supports backgrounding
 */
BOOL TFIsMultiTaskingSupported(void);

/**
 * @return TRUE if the device is iPad.
 */
BOOL TFIsPad(void);

/**
 * @return the current device orientation.
 */
UIDeviceOrientation TFDeviceOrientation(void);

/**
 * @return TRUE if the current device orientation is portrait or portrait upside down.
 */
BOOL TFDeviceOrientationIsPortrait(void);

/**
 * @return TRUE if the current device orientation is landscape left, or landscape right.
 */
BOOL TFDeviceOrientationIsLandscape(void);

/**
 * @return device full model name in human readable strings
 */
NSString* TFDeviceModelName(void);

/**
 * On iPhone/iPod touch
 * Checks if the orientation is portrait, landscape left, or landscape right.
 * This helps to ignore upside down and flat orientations.
 *
 * On iPad:
 * Always returns Yes.
 */
BOOL TFIsSupportedOrientation(UIInterfaceOrientation orientation);

/**
 * @return the rotation transform for a given orientation.
 */
CGAffineTransform TFRotateTransformForOrientation(UIInterfaceOrientation orientation);

/**
 * @return the application frame with no offset.
 *
 * From the Apple docs:
 * Frame of application screen area in points (i.e. entire screen minus status bar if visible)
 */
CGRect TFApplicationFrame(void);

/**
 * @return the toolbar height for a given orientation.
 *
 * The toolbar is slightly shorter in landscape.
 */
CGFloat TFToolbarHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @return the height of the keyboard for a given orientation.
 */
CGFloat TFKeyboardHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @return the space between the edge of the screen and a grouped table cell. Larger on iPad.
 */
CGFloat TFGroupedTableCellInset(void);

/**
 * A convenient way to show a UIAlertView with a message.
 */
void TFAlert(NSString* message);

/**
 * Same as TFAlert but the alert view has no title.
 */
void TFAlertNoTitle(NSString* message);


///////////////////////////////////////////////////////////////////////////////////////////////////
// Debug logging helpers

#define TFLOGRECT(rect) \
TFDINFO(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y, \
rect.size.width, rect.size.height)

#define TFLOGPOINT(pt) \
TFDINFO(@"%s x=%f, y=%f", #pt, pt.x, pt.y)

#define TFLOGSIZE(size) \
TFDINFO(@"%s w=%f, h=%f", #size, size.width, size.height)

#define TFLOGEDGES(edges) \
TFDINFO(@"%s left=%f, right=%f, top=%f, bottom=%f", #edges, edges.left, edges.right, \
edges.top, edges.bottom)

#define TFLOGHSV(_COLOR) \
TFDINFO(@"%s h=%f, s=%f, v=%f", #_COLOR, _COLOR.hue, _COLOR.saturation, _COLOR.value)

#define TFLOGVIEWS(_VIEW) \
{ for (UIView* view = _VIEW; view; view = view.superview) { TFDINFO(@"%@", view); } }


///////////////////////////////////////////////////////////////////////////////////////////////////
// Dimensions of common iPhone OS Views

/**
 * The standard height of a row in a table view controller.
 * @const 44 pixels
 */
extern const CGFloat tfkDefaultRowHeight;

/**
 * The standard height of a toolbar in portrait orientation.
 * @const 44 pixels
 */
extern const CGFloat tfkDefaultPortraitToolbarHeight;

/**
 * The standard height of a toolbar in landscape orientation.
 * @const 33 pixels
 */
extern const CGFloat tfkDefaultLandscapeToolbarHeight;

/**
 * The standard height of the keyboard in portrait orientation.
 * @const 216 pixels
 */
extern const CGFloat tfkDefaultPortraitKeyboardHeight;

/**
 * The standard height of the keyboard in landscape orientation.
 * @const 160 pixels
 */
extern const CGFloat tfkDefaultLandscapeKeyboardHeight;

/**
 * The space between the edge of the screen and the cell edge in grouped table views.
 * @const 10 pixels
 */
extern const CGFloat tfkGroupedTableCellInset;

/**
 * Deprecated macros for common constants.
 */
#define TF_ROW_HEIGHT                     tfkDefaultRowHeight
#define TF_TOOLBAR_HEIGHT                 tfkDefaultPortraitToolbarHeight
#define TF_LANDSCAPE_TOOLBAR_HEIGHT       tfkDefaultLandscapeToolbarHeight

#define TF_KEYBOARD_HEIGHT                tfkDefaultPortraitKeyboardHeight
#define TF_LANDSCAPE_KEYBOARD_HEIGHT      tfkDefaultLandscapeKeyboardHeight
#define TF_IPAD_KEYBOARD_HEIGHT           tfkDefaultPadPortraitKeyboardHeight
#define TF_IPAD_LANDSCAPE_KEYBOARD_HEIGHT tfkDefaultPadLandscapeKeyboardHeight

///////////////////////////////////////////////////////////////////////////////////////////////////
// Animation

/**
 * The standard duration length for a transition.
 * @const 0.3 seconds
 */
extern const CGFloat tfkDefaultTransitionDuration;

/**
 * The standard duration length for a fast transition.
 * @const 0.2 seconds
 */
extern const CGFloat tfkDefaultFastTransitionDuration;

/**
 * The standard duration length for a flip transition.
 * @const 0.7 seconds
 */
extern const CGFloat tfkDefaultFlipTransitionDuration;

/**
 * Deprecated macros for common constants.
 */
#define TF_TRANSITION_DURATION      tfkDefaultTransitionDuration
#define TF_FAST_TRANSITION_DURATION tfkDefaultFastTransitionDuration
#define TF_FLIP_TRANSITION_DURATION tfkDefaultFlipTransitionDuration