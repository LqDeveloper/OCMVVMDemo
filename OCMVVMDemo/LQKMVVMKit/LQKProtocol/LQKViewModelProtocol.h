//
//  LQKViewModelProtocol.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/17.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LQKRequestBlockMacro.h"


//ViewModel处理完View的事假后的回调
typedef void (^LQKViewModelBlock)(NSDictionary *info);


@protocol LQKViewModelProtocol <NSObject>


@optional


/**
 网络请求 返回处理好的数据

 @param progress 请求进度
 @param success 请求成功
 @param failure 请求失败
 @return 请求任务
 */
-(NSURLSessionTask *)lqk_viewLoadDataWithProgress:(LQKProgressBlock)progress success:(LQKRequestSuccessBlock)success andFailure:(LQKRequestFailureBlock)failure;


/**
 网络请求 返回处理好的数据

 @param responseBlock 请求结果
 @return 请求任务
 */
-(NSURLSessionTask *)lqK_viewLoadDataWithResponse:(LQKRequestBlock)responseBlock;


/**
 通过ViewModel 进行页面跳转

 @param viewController 要跳转的源VC
 @param info 跳转要传递的信息
 */
-(void)lqk_viewInViewController:(UIViewController *)viewController andEvent:(NSDictionary *)info;



/**
  ViewModel处理完View事件后 返回一个回调给View，方便View在它父视图上做处理

 @param callbackBlock 将处理结果回调给View
 */
-(void)lqk_handleViewCallbackBlock:(void(^)(NSDictionary *info))callbackBlock;

@end
