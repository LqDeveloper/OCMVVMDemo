//
//  LQKTool.m
//  MyFramework
//
//  Created by Quan Li on 2017/10/9.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "LQKUITool.h"

@implementation LQKUITool
+(UIButton *)createButtonWithTitle:(NSString *)title andFont:(UIFont *)font  andBgColor:(UIColor *)bgColor andTarget:(id)target andSelector:(SEL)selector{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.titleLabel.font = font;
    
    [button setBackgroundColor:bgColor];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+(UIButton *)createButtonWithTitle:(NSString *)title andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andTarget:(id)target andSelector:(SEL)selector{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:color forState:UIControlStateNormal];
    
    button.titleLabel.font = font;
    
    [button setBackgroundColor:bgColor];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+(UIButton *)createButtonWithTitle:(NSString *)title andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andAngle:(CGFloat)angle andTarget:(id)target andSelector:(SEL)selector{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:color forState:UIControlStateNormal];
    
    button.titleLabel.font = font;
    
    [button setBackgroundColor:bgColor];
    
    button.layer.cornerRadius = angle;
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}




+(UILabel *)createLabelWithText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor andTextAlign:(NSTextAlignment)textAlign{
    UILabel *label = [[UILabel alloc]init];
    
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlign;
    label.backgroundColor = bgColor;
    return label;
}


+(UILabel *)createLabelWithText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)color andBgColor:(UIColor *)bgColor  andTextAlign:(NSTextAlignment)textAlign andAngle:(CGFloat)angle{
    UILabel *label = [[UILabel alloc]init];
    
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlign;
    label.backgroundColor = bgColor;
    label.layer.cornerRadius = angle;
    label.layer.masksToBounds = YES;
    
    return label;
}


@end
