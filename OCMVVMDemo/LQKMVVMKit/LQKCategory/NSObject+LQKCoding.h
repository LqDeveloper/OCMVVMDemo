//
//  NSObject+LQKCoding.h
//  MyFramework
//
//  Created by Quan Li on 2017/10/10.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  LQCodingProtocol个性化设置archiver协议
 */
@protocol LQKCodingProtocol <NSObject>


//如果未实现以下方法则全部属性都会归档
@optional


/**
 *  这个数组中的属性名才会进行归档
 */
- (NSArray *)lqk_allowedCodingPropertyNames;


/**
 *  这个数组中的属性名将会被忽略：不进行归档   如果在上面的函数中和下面的函数有相同的属性名的话，该属性仍然会被忽略归档
 */
- (NSArray *)lqk_ignoredCodingPropertyNames;


@end


@interface NSObject (LQKCoding)<LQKCodingProtocol,NSCoding>


/**
 archiver

 @param path 保存路径
 @param useAuxiliaryFile YES是保证文件的写入原子性,就是说会先创建一个临时文件,直到文件内容写入成功再导入到目标文件里.NO是直接写入
 @return 是否保存成功
 */


-(BOOL)lqk_writeToFilePath:(NSString *)path atomically:(BOOL)useAuxiliaryFile;


/**
 unarchiver

 @param path 文件路径
 @return 返回解归档的对象
 */
+(instancetype)lqk_objectWithFilePath:(NSString *)path;


@end
