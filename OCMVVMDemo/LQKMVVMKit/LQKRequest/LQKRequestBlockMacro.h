//
//  LQKRequestBlockMacro.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#ifndef LQKRequestBlockMacro_h
#define LQKRequestBlockMacro_h

#import <Foundation/Foundation.h>

//网络请求成功的回调
typedef void (^LQKRequestSuccessBlock)(id responseObject);

//网络请求失败的回调
typedef void (^LQKRequestFailureBlock)(NSError *error);

//网络请求成功和事变
typedef void (^LQKRequestBlock)(id responseObject,NSError *error);

//网络请求的进度
typedef void (^LQKProgressBlock)(NSProgress *progess);


#endif /* LQKRequestBlockMacro_h */
