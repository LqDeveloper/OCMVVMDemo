//
//  LQKFileManager.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQKUserMacro.h"
@interface LQKFileManager : NSObject

LQKSingletonH

/**
 获取沙盒路径

 @return 沙盒路径
 */
-(NSString *)lqk_getRootDirectory;


/**
 获取Documents路径

 @return Documents路径
 */
-(NSString *)lqk_getDocumentDirectory;


/**
 获取library 路径

 @return  获取library 路径
 */
-(NSString *)lqk_getLibraryDirectory;


/**
 获取Cache路径

 @return 获取Cache路径
 */
-(NSString *)lqk_getCacheDirectory;


/**
 //获取Tmp路径

 @return 获取Tmp路径
 */
-(NSString *)lqk_getTmpDirectory;



/**
 文件夹是否存在

 @param dirPath 文件夹路径
 @return 是否存在
 */
-(BOOL)lqk_dirIsExistWithDirPath:(NSString *)dirPath;

/**
 文件是否存在

 @param filePath 文件路径
 @return 是否存在
 */
-(BOOL)lqk_fileIsExistWithFilePath:(NSString *)filePath;


/**
 创建文件夹
 
 @param dirName 文件夹名字
 @param dirPath 路径
 @return 是否创建成功
 */
-(BOOL)lqk_createDirWithDirName:(NSString *)dirName andDirPath:(NSString *)dirPath;


/**
 创建文件

 @param fileName 文件名
 @param filePath 文件路径
 @return 是否创建成功
 */
-(BOOL)lqk_createFileWithFileName:(NSString*)fileName andFilePath:(NSString *)filePath;


/**
 将字符串写入文件

 @param dataStr 要写入的字符串
 @param filePath 文件路径
 @return 是否写入成功
 */
-(BOOL)lqk_writeDataWith:(NSString *)dataStr ToFilePath:(NSString *)filePath;


/**
 读取文件内容

 @param filePath 文件路径
 @return 文件内容
 */
-(NSString *)lqk_readDataFromFilePath:(NSString *)filePath;


/**
 获取文件属性

 @param filePath 文件路径
 @return 文件属性
 */
-(NSDictionary *)lqk_getFileAttributesWithFilePath:(NSString *)filePath;


/**
 删除文件

 @param filePath 文件路径
 @return 是否删除成功
 */
-(BOOL)lqk_deleteFileWithFilePath:(NSString *)filePath;


/**
 删除文件夹

 @param dirPath 文件夹路径
 @return 是否删除成功
 */
-(BOOL)lqk_deleteDirWithDirPath:(NSString *)dirPath;


/**
 删除文件夹里面的文件但不删除文件夹

 @param dirPath 文件夹路径
 @return 是否删除成功
 */
-(BOOL)lqk_deleteDirContainFileWithDirPath:(NSString *)dirPath;


/**
 删除文件夹里面的指定类型的文件但不删除文件夹

 @param dirPath 文件夹路径
 @param fileType 文件类型
 @return 是否删除成功
 */
-(BOOL)lqk_deleteDirContainFileWithDirPath:(NSString *)dirPath andFileType:(NSString *)fileType;
@end
