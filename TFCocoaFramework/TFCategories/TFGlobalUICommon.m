//
//  TFGlobalUICommon.m
//  TFCocoaFramework
//
//  Created by Melvin on 7/14/15.
//  Copyright © 2015 TimeFace. All rights reserved.
//

#import "TFGlobalUICommon.h"

#include <sys/types.h>
#include <sys/sysctl.h>

const CGFloat tfkDefaultRowHeight                  = 44.0f;

const CGFloat tfkDefaultPortraitToolbarHeight      = 44.0f;
const CGFloat tfkDefaultLandscapeToolbarHeight     = 33.0f;

const CGFloat tfkDefaultPortraitKeyboardHeight     = 216.0f;
const CGFloat tfkDefaultLandscapeKeyboardHeight    = 160.0f;
const CGFloat tfkDefaultPadPortraitKeyboardHeight  = 264.0f;
const CGFloat tfkDefaultPadLandscapeKeyboardHeight = 352.0f;

const CGFloat tfkGroupedTableCellInset             = 9.0f;
const CGFloat tfkGroupedPadTableCellInset          = 42.0f;

const CGFloat tfkDefaultTransitionDuration         = 0.3f;
const CGFloat tfkDefaultFastTransitionDuration     = 0.2f;
const CGFloat tfkDefaultFlipTransitionDuration     = 0.7f;


UIInterfaceOrientation TFInterfaceOrientation(void) {
    UIInterfaceOrientation orient = [UIApplication sharedApplication].statusBarOrientation;
    return orient;
}
CGRect TFScreenBounds(void) {
    CGRect bounds = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape(TFInterfaceOrientation())) {
        CGFloat width = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = width;
    }
    return bounds;
}

CGSize TFScreenSize(void) {
    CGRect bounds = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape(TFInterfaceOrientation())) {
        CGFloat width = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = width;
    }
    return CGSizeMake(bounds.size.width, bounds.size.height);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
float TFOSVersion(void) {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFRuntimeOSVersionIsAtLeast(float version) {
    
    static const CGFloat kEpsilon = 0.0000001f;
    return TFOSVersion() - version > -kEpsilon;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFIsPhoneSupported(void) {
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType isEqualToString:@"iPhone"];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFIsMultiTaskingSupported(void) {
    return [[UIDevice currentDevice] isMultitaskingSupported];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFIsPad(void) {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
UIDeviceOrientation TFDeviceOrientation(void) {
    UIDeviceOrientation orient = [[UIDevice currentDevice] orientation];
    if (UIDeviceOrientationUnknown == orient) {
        return UIDeviceOrientationPortrait;
        
    } else {
        return orient;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFDeviceOrientationIsPortrait(void) {
    UIDeviceOrientation orient = TFDeviceOrientation();
    
    switch (orient) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            return YES;
        default:
            return NO;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFDeviceOrientationIsLandscape(void) {
    UIDeviceOrientation orient = TFDeviceOrientation();
    
    switch (orient) {
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            return YES;
        default:
            return NO;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TFDeviceModelName(void) {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = @(machine);
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    
    return platform;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TFIsSupportedOrientation(UIInterfaceOrientation orientation) {
    if (TFIsPad()) {
        return YES;
        
    } else {
        switch (orientation) {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                return YES;
            default:
                return NO;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGAffineTransform TFRotateTransformForOrientation(UIInterfaceOrientation orientation) {
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
        
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
        
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
        
    } else {
        return CGAffineTransformIdentity;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect TFApplicationFrame(void) {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat TFToolbarHeightForOrientation(UIInterfaceOrientation orientation) {
    if (UIInterfaceOrientationIsPortrait(orientation) || TFIsPad()) {
        return TF_ROW_HEIGHT;
        
    } else {
        return TF_LANDSCAPE_TOOLBAR_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat TFKeyboardHeightForOrientation(UIInterfaceOrientation orientation) {
    if (TFIsPad()) {
        return UIInterfaceOrientationIsPortrait(orientation) ? TF_IPAD_KEYBOARD_HEIGHT
        : TF_IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
        
    } else {
        return UIInterfaceOrientationIsPortrait(orientation) ? TF_KEYBOARD_HEIGHT
        : TF_LANDSCAPE_KEYBOARD_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat TFGroupedTableCellInset(void) {
    return TFIsPad() ? tfkGroupedPadTableCellInset : tfkGroupedTableCellInset;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
void TFAlert(NSString* message) {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Alert", @"")
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                          otherButtonTitles:nil];
    [alert show];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void TFAlertNoTitle(NSString* message) {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                          otherButtonTitles:nil];
    [alert show];
}