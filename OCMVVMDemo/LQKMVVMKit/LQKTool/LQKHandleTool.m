//
//  LQKHandleTool.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/21.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "LQKHandleTool.h"

@implementation LQKHandleTool


+(CGSize)lqk_getSizeWithString:(NSString *)text andFont:(UIFont *)font andSize:(CGSize)size{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return textSize;
}


+(CGFloat)lqk_getWidthWithString:(NSString *)text andFont:(UIFont *)font andHeight:(CGFloat)height{
    return [LQKHandleTool lqk_getSizeWithString:text andFont:font andSize:CGSizeMake(0, height)].width;
}


+(CGFloat)lqk_getHeightWithString:(NSString *)text andFont:(UIFont *)font andWidth:(CGFloat)width{
    return [LQKHandleTool lqk_getSizeWithString:text andFont:font andSize:CGSizeMake(width, 0)].height;
}



@end
