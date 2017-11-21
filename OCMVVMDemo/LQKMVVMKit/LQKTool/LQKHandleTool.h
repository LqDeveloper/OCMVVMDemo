//
//  LQKHandleTool.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/21.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQKHandleTool : NSObject


/**
 计算字符串大小

 @param text 字符串
 @param font 字体
 @param size size
 @return 字符串大小
 */
+(CGSize)lqk_getSizeWithString:(NSString*)text andFont:(UIFont *)font andSize:(CGSize)size;




/**
 计算宽度

 @param text 字符串
 @param font 字体
 @param height 高度
 @return 宽度
 */
+(CGFloat)lqk_getWidthWithString:(NSString *)text andFont:(UIFont *)font andHeight:(CGFloat)height;


/**
 计算高度

 @param text 字符串
 @param font 字体
 @param width 宽度
 @return 高度
 */
+(CGFloat)lqk_getHeightWithString:(NSString *)text andFont:(UIFont *)font andWidth:(CGFloat)width;


@end
