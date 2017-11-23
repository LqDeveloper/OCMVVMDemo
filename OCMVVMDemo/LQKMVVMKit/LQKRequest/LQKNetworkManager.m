//
//  LQKNetworkManager.m
//  MyFramework
//
//  Created by liquan on 2017/10/16.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "LQKNetworkManager.h"

#import "AFNetworking.h"

#import <YYCache/YYCache.h>

#import <YYWebImage/YYWebImage.h>

@interface LQKNetworkManager()

@property(nonatomic,strong)AFHTTPSessionManager *sessionManager;

@property(nonatomic,strong)YYCache *dataCache;

@property(nonatomic,strong)YYImageCache *imageCache;
@end

@implementation LQKNetworkManager
//单例
LQKSingletonM


+(void)lqk_startGetNetworkStatus{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    LQKNetworkManager *networkManager = [LQKNetworkManager sharedInstance];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                networkManager.networkStatus = LQKNetworkNotReachable;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                networkManager.networkStatus = LQKNetworkNotReachable;
                break;
                //手机自带网络
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkManager.networkStatus = LQKNetworkWWAN;
                break;
                //Wifi
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkManager.networkStatus = LQKNetworkWIFI;
                break;
        }
    }];
    [manager startMonitoring];
}


- (void)lqk_cancelAllOperations {
    [self.sessionManager.operationQueue cancelAllOperations];
}


-(NSURLSessionDataTask *)lqk_postRequestWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andProgress:(LQKProgressBlock )progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
   
    
    return  [self.sessionManager POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
      
        BLOCK_EXEC(progress,uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BLOCK_EXEC(success,responseObject);
      
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        BLOCK_EXEC(failure,error,response.statusCode,error.description);
        
    }];
    
    
}


-(NSURLSessionDataTask *)lqk_getRequestWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andProgress:(LQKProgressBlock )progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    
    return [self.sessionManager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        BLOCK_EXEC(progress,downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BLOCK_EXEC(success,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        BLOCK_EXEC(failure,error,response.statusCode,error.description);
        
    }];
    
}


-(NSURLSessionDataTask *)lqk_loadDataByPostWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andIsCache:(BOOL)isCache  WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    return [self lqk_postRequestWithUrl:urlStr andParams:params andProgress:nil WhenSuccess:^(NSDictionary *responseObject) {
        
            if (isCache) {
                [self.dataCache setObject:responseObject forKey:urlStr];
            }
            if (self.networkStatus == LQKNetworkWWAN ||self.networkStatus == LQKNetworkWIFI) {
                BLOCK_EXEC(success,responseObject);
            }else{
                id jsonData = [self.dataCache objectForKey:urlStr];
                BLOCK_EXEC(success,jsonData);
            }
      
    } WhenFailure:^(NSError *error,NSInteger statusCode, NSString *errorStr) {

        BLOCK_EXEC(failure,error,statusCode,errorStr);
    }];
}
-(NSURLSessionDataTask *)lqk_loadDataByGetWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andIsCache:(BOOL)isCache WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    
    return [self lqk_getRequestWithUrl:urlStr andParams:params andProgress:nil WhenSuccess:^(NSDictionary *responseObject) {
        
        if (isCache) {
            [self.dataCache setObject:responseObject forKey:urlStr];
        }
        if (self.networkStatus == LQKNetworkWWAN ||self.networkStatus == LQKNetworkWIFI) {
            BLOCK_EXEC(success,responseObject);
        }else{
            id jsonData = [self.dataCache objectForKey:urlStr];
            BLOCK_EXEC(success,jsonData);
        }
        
    } WhenFailure:^(NSError *error, NSInteger statusCode, NSString *errorStr) {
        BLOCK_EXEC(failure,error,statusCode,errorStr);
    }];
}





-(NSURLSessionDataTask *)lqk_loadDataByPostWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    return [self lqk_postRequestWithUrl:urlStr andParams:params andProgress:nil WhenSuccess:^(NSDictionary *responseObject) {
        BLOCK_EXEC(success,responseObject);
    } WhenFailure:^(NSError *error,NSInteger statusCode, NSString *errorStr) {
        BLOCK_EXEC(failure,error,statusCode,errorStr);
    }];
}

-(NSURLSessionDataTask *)lqk_loadDataByGetWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    return [self lqk_getRequestWithUrl:urlStr andParams:params andProgress:nil WhenSuccess:^(NSDictionary *responseObject) {
         BLOCK_EXEC(success,responseObject);
    } WhenFailure:^(NSError *error, NSInteger statusCode, NSString *errorStr) {
         BLOCK_EXEC(failure,error,statusCode,errorStr);
    }];

}

-(NSURLSessionDataTask*)lqk_uploadImageWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andImage:(UIImage *)image andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    
    NSData *data = UIImagePNGRepresentation(image);
    
    // 给图片重命名
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
    
    return [self.sessionManager POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData  appendPartWithFormData:data name:fileName];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        BLOCK_EXEC(progress,uploadProgress);
        // NSLog(@"下载进度:%.2f%%",100.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BLOCK_EXEC(success,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        BLOCK_EXEC(failure,error,response.statusCode,error.description);
    }];
}

-(NSURLSessionDataTask *)lqk_uploadImageWithUrl:(NSString *)urlStr andParams:(NSDictionary *)params andImage:(UIImage *)image andImageName:(NSString *)imageName andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKRequestSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    NSData *data = UIImagePNGRepresentation(image);
    
    // 给图片重命名
    NSString *fileName = [NSString stringWithFormat:@"%@.png",imageName];
    
    return [self.sessionManager POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData  appendPartWithFormData:data name:fileName];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        BLOCK_EXEC(progress,uploadProgress);
        // NSLog(@"下载进度:%.2f%%",100.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BLOCK_EXEC(success,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        BLOCK_EXEC(failure,error,response.statusCode,error.description);
    }];
}



-(NSURLSessionDownloadTask *)lqk_downloadFileWithUrl:(NSString *)urlStr andFileName:(NSString *)fileName  andProgress:(LQKProgressBlock)progress WhenSuccess:(LQKDownloadSuccessBlock)success WhenFailure:(LQKRequestFailureBlock)failure{
    
    return [self.sessionManager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]] progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        BLOCK_EXEC(progress,downloadProgress);
        // NSLog(@"下载进度:%.2f%%",100.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        NSString *downloadDir = [NSString stringWithFormat:@"%@/Download",DocumentsFilePath];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //创建Download目录
        if (![fileManager fileExistsAtPath:downloadDir]) {
            [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        //拼接文件路径
         NSString *filePath = [downloadDir stringByAppendingPathComponent:fileName];
       
        //返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {

        BLOCK_EXEC(success,filePath.absoluteString);
        
        NSHTTPURLResponse *responseHTTP = (NSHTTPURLResponse *)response;
        BLOCK_EXEC(failure,error,responseHTTP.statusCode,error.description);
    }];
    
}

-(BOOL)lqk_removeFileWith:(NSString *)filePath{
     NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) {
         return [fileManager removeItemAtPath:filePath error:nil];
    }
    return NO;
}

-(void)lqk_removeAllCache{
    [self.dataCache.diskCache removeAllObjects];
    [self.dataCache.memoryCache removeAllObjects];
    [self.imageCache.diskCache removeAllObjects];
    [self.imageCache.memoryCache removeAllObjects];
}

-(NSString*)lqk_getCacheSize{
    NSInteger totalSize = self.imageCache.memoryCache.totalCost + self.imageCache.diskCache.totalCost + self.dataCache.memoryCache.totalCost + self.dataCache.diskCache.totalCost;
    NSString *sizeStr;
    if (totalSize < 1024) {
        sizeStr = [NSString stringWithFormat:@"%ldB",totalSize];
    }else if(totalSize > 1024 && totalSize < 1024*1024){
        sizeStr = [NSString stringWithFormat:@"%.2fKB",totalSize/1024.0];
    }else{
        sizeStr = [NSString stringWithFormat:@"%.2fMB",totalSize/(1024.0*1024.0)];
    }
    return sizeStr;
}







#pragma mark -- 懒加载
-(AFHTTPSessionManager *)sessionManager{
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        //设置参数类型
        _sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //设置请求超时时间
        _sessionManager.requestSerializer.timeoutInterval = 30.f;
        //设置服务器返回结果类型:JSON
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/JavaScript",@"text/html",@"text/plain", nil];
    }
    return _sessionManager;
    
}
-(YYCache *)dataCache{
    if (!_dataCache) {
        _dataCache = [YYCache cacheWithName:@"LQDNetworkManager"];
        [_dataCache.memoryCache setCountLimit:NSUIntegerMax];//内存最大缓存数据个数
        [_dataCache.memoryCache setCostLimit:1*1024];//内存最大缓存开销 目前这个毫无用处
        [_dataCache.diskCache setCostLimit:10*1024];//磁盘最大缓存开销
        [_dataCache.diskCache setCountLimit:NSUIntegerMax];//磁盘最大缓存数据个数
        [_dataCache.diskCache setAutoTrimInterval:60];//设置磁盘lru动态清理频率 默认 60秒
    }
    return _dataCache;
}
-(YYImageCache *)imageCache{
    return [YYWebImageManager sharedManager].cache;
}
@end
