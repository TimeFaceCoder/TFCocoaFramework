//
//  TFStyle.h
//  TFCocoaFramework
//
//  Created by Melvin on 7/14/15.
//  Copyright © 2015 TimeFace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFStyle : NSObject

+ (TFStyle*)globalStyleSheet;

+ (void)setGlobalStyleSheet:(TFStyle*)styleSheet;

- (UIColor *)getColorByHex:(NSString *)hexColor;
- (UIColor *)getColorByHex:(NSString *)hexColor alpha:(CGFloat)alpha;

/**
 *  ARGB转为颜色值
 *
 *  @param argb
 *
 *  @return
 */
-(UIColor *)getColorFromHexARGB:(NSString *)hexColor;

@end
