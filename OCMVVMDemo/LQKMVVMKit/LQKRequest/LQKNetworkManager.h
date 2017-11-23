//
//  LQKNetworkManager.h
//  MyFramework
//
//  Created by liquan on 2017/10/16.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQKRequestBlockMacro.h"


@interface LQKNetworkManager : NSObject
//网路状态
@property(nonatomic,assign)LQKNetworkStatus networkStatus;

/**
 开始监听网络状态 用在delegate中
 */
+(void)lqk_startGetNetworkStatus;
// 单例
LQKSingletonH;


/**
 请求数据 POST

 @param urlStr url
 @param params 参数
 @param isCache 是否缓存
 @param success 请求成功
 @param failure 求求失败
 @return 请求任务
 */
-(NSURLSessionDataTask *)lqk_loadDataByPostWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andIsCache:(BOOL)isCache  WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 请求数据 POST
 
 @param urlStr url
 @param params 参数
 @param success 请求成功
 @param failure 求求失败
 @return 请求任务
 */
-(NSURLSessionDataTask *)lqk_loadDataByPostWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params  WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 请求数据 GET
 
 @param urlStr url
 @param params 参数
 @param isCache 是否缓存
 @param success 请求成功
 @param failure 求求失败
 @return 请求任务
 */
-(NSURLSessionDataTask *)lqk_loadDataByGetWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andIsCache:(BOOL)isCache  WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 请求数据 GET
 
 @param urlStr url
 @param params 参数
 @param success 请求成功
 @param failure 求求失败
 @return 请求任务
 */
-(NSURLSessionDataTask *)lqk_loadDataByGetWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params  WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 上传图片

 @param urlStr url
 @param params 参数
 @param image 要上传的图片
 @param progress 上传进度
 @param success 上传成功
 @param failure 上传失败
 @return 上传任务
 */
-(NSURLSessionDataTask*)lqk_uploadImageWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andImage:(UIImage *)image andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
  上传图片 传图片名

 @param urlStr url
 @param params 参数
 @param image 要上传的图片
 @param imageName 图片名字
 @param progress 上传进度
 @param success 上传成功
 @param failure 上传失败
 @return 上传任务
 */
-(NSURLSessionDataTask*)lqk_uploadImageWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andImage:(UIImage *)image  andImageName:(NSString *)imageName andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 下载文件

 @param urlStr url 要拼接参数
 @param progress 下载进度
 @param success 下载成功
 @param failure 下载失败
 @return 下载任务
 */
-(NSURLSessionDownloadTask *)lqk_downloadFileWithUrl:(NSString *)urlStr andFileName:(NSString *)fileName   andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKDownloadSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure;


/**
 取消所有请求
 */
- (void)lqk_cancelAllOperations;

/**
 删除下载的文件

 @param filePath 文件路径
 */
-(BOOL)lqk_removeFileWith:(NSString*)filePath;

/**
 获取缓存大小
 */
-(NSString *)lqk_getCacheSize;

/**
 清除所有缓存
 */
-(void)lqk_removeAllCache;
@end
