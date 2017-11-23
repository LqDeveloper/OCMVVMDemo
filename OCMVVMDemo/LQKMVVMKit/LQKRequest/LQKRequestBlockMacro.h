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

typedef   NS_ENUM(NSInteger,LQKNetworkStatus){
    //无网络
    LQKNetworkNotReachable,
    //手机网络
    LQKNetworkWWAN,
    //Wifi
    LQKNetworkWIFI
};


//网络请求成功的回调
typedef void (^LQKRequestSuccessBlock)(NSDictionary* responseObject);

//网络请求失败的回调
typedef void (^LQKRequestFailureBlock)(NSError *error,NSInteger statusCode,NSString *errorStr);

//网络请求成功和事变
typedef void (^LQKRequestBlock)(NSDictionary * responseObject,NSError *error);

//网络请求的进度
typedef void (^LQKProgressBlock)(NSProgress *progess);

//下载
typedef void (^LQKDownloadSuccessBlock)(NSString *filePath);

#endif /* LQKRequestBlockMacro_h */
