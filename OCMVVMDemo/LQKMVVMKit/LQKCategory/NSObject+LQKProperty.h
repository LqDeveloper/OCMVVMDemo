//
//  NSObject+LQKProperty.h
//
//
//  Created by liquan on 2017/11/17.
//  Copyright © 2017年 liquan. All rights reserved.
//  通过解析字典自动生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (LQKProperty)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;


@end
