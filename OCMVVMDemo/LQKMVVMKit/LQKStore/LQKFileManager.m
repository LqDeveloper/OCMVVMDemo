//
//  LQKFileManager.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "LQKFileManager.h"

@interface LQKFileManager()
@property(nonatomic)NSFileManager *fileManager;
@end

@implementation LQKFileManager


-(NSFileManager *)fileManager{
    if (!_fileManager) {
        _fileManager = [NSFileManager defaultManager];
    }
    return _fileManager;
}


LQKSingletonM

-(NSString *)lqk_getRootDirectory{
    return NSHomeDirectory();
}


-(NSString *)lqk_getDocumentDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    return  [paths objectAtIndex:0];
}


-(NSString *)lqk_getLibraryDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return  [paths objectAtIndex:0];
}


-(NSString *)lqk_getCacheDirectory{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    return  [cacPath objectAtIndex:0];
}


-(NSString *)lqk_getTmpDirectory{
    return NSTemporaryDirectory();
}


-(BOOL)lqk_dirIsExistWithDirPath:(NSString *)dirPath{
    BOOL isDir = NO;
    BOOL existed = [self.fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( isDir == YES && existed == YES){
        return YES;
    }else{
        return NO;
    }
}

-(BOOL)lqk_fileIsExistWithFilePath:(NSString *)filePath{
    return  [self.fileManager fileExistsAtPath:filePath];
}


-(BOOL)lqk_createDirWithDirName:(NSString *)dirName andDirPath:(NSString *)dirPath{
    
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",dirPath,dirName];
    
    if (![self lqk_dirIsExistWithDirPath:fullPath]) {
        return  [self.fileManager createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
    }else{
        return NO;
    }
}

-(BOOL)lqk_createFileWithFileName:(NSString *)fileName andFilePath:(NSString *)filePath{
    
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",filePath,fileName];
    
    if (![self lqk_fileIsExistWithFilePath:fullPath]) {
        return [self.fileManager createFileAtPath:fullPath contents:nil attributes:nil];
    }else{
        return NO;
    }
}


-(BOOL)lqk_writeDataWith:(NSString *)dataStr ToFilePath:(NSString *)filePath{
    if ([self lqk_fileIsExistWithFilePath:filePath]) {
        return [dataStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        return NO;
    }
}

-(NSString *)lqk_readDataFromFilePath:(NSString *)filePath{
    if ([self lqk_fileIsExistWithFilePath:filePath]) {
        return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }else{
        return nil;
    }
    
}

-(NSDictionary *)lqk_getFileAttributesWithFilePath:(NSString *)filePath{
    if ([self lqk_fileIsExistWithFilePath:filePath]) {
        return  [self.fileManager attributesOfItemAtPath:filePath error:nil];
    }else{
        return nil;
    }
}

-(BOOL)lqk_deleteDirWithDirPath:(NSString *)dirPath{
    if ([self lqk_dirIsExistWithDirPath:dirPath]) {
        return [self.fileManager removeItemAtPath:dirPath error:nil];
    }else{
        return NO;
    }
}
-(BOOL)lqk_deleteFileWithFilePath:(NSString *)filePath{
    if ([self lqk_fileIsExistWithFilePath:filePath]) {
        return [self.fileManager removeItemAtPath:filePath error:nil];
    }else{
        return NO;
    }
}

-(BOOL)lqk_deleteDirContainFileWithDirPath:(NSString *)dirPath{
    if ([self lqk_dirIsExistWithDirPath:dirPath]) {
        NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:dirPath error:NULL];
        
        NSEnumerator *e = [contents objectEnumerator];
        
        NSString *filename;
        while ((filename = [e nextObject])) {
            [self.fileManager removeItemAtPath:[dirPath stringByAppendingPathComponent:filename] error:NULL];
        }
        return YES;
    }else{
        return NO;
    }
}


-(BOOL)lqk_deleteDirContainFileWithDirPath:(NSString *)dirPath andFileType:(NSString *)fileType{
    if ([self lqk_dirIsExistWithDirPath:dirPath]) {
        NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:dirPath error:NULL];
        
        NSEnumerator *e = [contents objectEnumerator];
        
        NSString *filename;
        while ((filename = [e nextObject])) {
            if ([[filename pathExtension] isEqualToString:fileType]) {
                [self.fileManager removeItemAtPath:[dirPath stringByAppendingPathComponent:filename] error:NULL];
            }
        }
        return YES;
    }else{
        return NO;
    }
}

@end
