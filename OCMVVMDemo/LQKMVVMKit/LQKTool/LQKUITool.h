//
//  LQKTool.h
//  MyFramework
//
//  Created by Quan Li on 2017/10/9.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQKUITool : NSObject


+(UIButton *)createButtonWithTitle:(NSString *)title andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andTarget:(id)target andSelector:(SEL)selector;


+(UIButton *)createButtonWithTitle:(NSString *)title andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andAngle:(CGFloat)angle andTarget:(id)target andSelector:(SEL)selector;


+(UILabel *)createLabelWithText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andTextAlign:(NSTextAlignment)textAlign;


+(UILabel *)createLabelWithText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andTextAlign:(NSTextAlignment)textAlign andAngle:(CGFloat)angle;


@end
