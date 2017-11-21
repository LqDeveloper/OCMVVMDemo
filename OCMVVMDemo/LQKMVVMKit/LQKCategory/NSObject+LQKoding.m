//
//  NSObject+LQKCoding.m
//  MyFramework
//
//  Created by Quan Li on 2017/10/10.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "NSObject+LQKCoding.h"
#import <objc/runtime.h>
@implementation NSObject (LQKCoding)


//NSCoding  安全编码
+ (BOOL)supportsSecureCoding {
    return YES;
}


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    [self setWithCoder:aDecoder];
    return self;
}

#pragma clang diagnostic pop


- (void)encodeWithCoder:(NSCoder *)aCoder {
    for (NSString *key in [self getProperties]) {
        id object = [self valueForKey:key];
        if (object) [aCoder encodeObject:object forKey:key];
    }
}


- (void)setWithCoder:(NSCoder *)aDecoder {
    for (NSString *key in [self getProperties]) {
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
}


-(NSDictionary *)getPropertiesDic{
    
    Class selfClass  = [self class];
    
    unsigned int count;
    
    __autoreleasing NSMutableDictionary *propertiesDic = [NSMutableDictionary dictionary];
    
    objc_property_t *properties = class_copyPropertyList(selfClass, &count);
    
    NSArray *allowCodingPropertyName = nil;
    
    if ([self respondsToSelector:@selector(lqk_allowedCodingPropertyNames)]) {
        allowCodingPropertyName = [self lqk_allowedCodingPropertyNames];
    }
    
    NSArray *ignoreCodingPropertyName = nil;
    
    if ([self respondsToSelector:@selector(lqk_ignoredCodingPropertyNames)]) {
        ignoreCodingPropertyName = [self lqk_ignoredCodingPropertyNames];
    }
    
    void(^setValueBlock)(NSString *key,NSMutableDictionary *propertyDic) = ^(NSString *key,NSMutableDictionary *propertyDic){
        if (![ignoreCodingPropertyName containsObject:key]) {
            id value = [self valueForKey:key];
            value = value ? value :[NSNull null];
            [propertyDic setObject:value forKey:key];
        }
    };
    
    if (allowCodingPropertyName.count) {
        for (unsigned int i = 0; i < count ; i++) {
            objc_property_t property  = properties[i];
            const char *propertyName = property_getName(property);
            __autoreleasing NSString *key = @(propertyName);
            
            if ([allowCodingPropertyName containsObject:key]) {
                setValueBlock(key,propertiesDic);
            }
        }
        free(properties);
        return propertiesDic;
    }
    
    for (unsigned int i = 0; i < count ; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        __autoreleasing NSString *key = @(propertyName);
        setValueBlock(key,propertiesDic);
    }
    free(properties);
    return propertiesDic;
}


-(NSDictionary*)getProperties{
    __autoreleasing NSDictionary *propertiesDic = objc_getAssociatedObject([self class], _cmd);
    if (!propertiesDic) {
        propertiesDic = [NSMutableDictionary dictionary];
        Class subClass = [self class];
        while (subClass != [NSObject class]) {
            [(NSMutableDictionary *)propertiesDic addEntriesFromDictionary:[self getPropertiesDic]];
            subClass = [subClass superclass];
        }
        propertiesDic = [NSDictionary dictionaryWithDictionary:propertiesDic];
        objc_setAssociatedObject([self class], _cmd, propertiesDic, OBJC_ASSOCIATION_RETAIN);
    }
    return propertiesDic;
}


-(BOOL)lqk_writeToFilePath:(NSString *)path atomically:(BOOL)useAuxiliaryFile {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [data writeToFile:path atomically:useAuxiliaryFile];
}


+(instancetype)lqk_objectWithFilePath:(NSString *)path{
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id object = nil;
    if (data) {
        NSPropertyListFormat format;
        object = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&format error:NULL];
        
        if (object) {
            if ([object respondsToSelector:@selector(objectForKey:)] && [(NSDictionary *)object objectForKey:@"$archiver"]) {
                object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }
        } else {
            object = data;
        }
    }
    
    return object;
}


@end
