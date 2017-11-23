//
//  LQKUserMacro.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#ifndef LQKUserMacro_h
#define LQKUserMacro_h


//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//是否是iPhoneX

#define kIsiPhoneX kStatusBarHeight == 44 

//导航的高度
#define kNavigationBarHeight 44


//tabBar的高度
#define kTabBarHeight 49


//tabbar距离底部的高度
#define kMarginBottom  kIsiPhoneX ? 34 : 0



//获取屏幕 宽度、高度
#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)


#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)


//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define LQKLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define LQDLog(...)
#endif


//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] //float类型

#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]//NSString类型

//bundle id
#define APPBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


//判断是否是iPad
#define IsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//判断是否是iPhone
#define IsPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


//获取keywindow
#define  KeyWindow  [UIApplication sharedApplication].keyWindow


/*
 Documents：保存应用运行时生成的需要持久化的数据iTunes会自动备份该目录。苹果建议将在应用程序中浏览到的文件数据保存在该目录下。
 
 Library/Caches：一般存储的是缓存文件，例如图片视频等，此目录下的文件不会再应用程序退出时删除，在手机备份的时候，iTunes不会备份该目录。
 
 Library/Preferences：保存应用程序的所有偏好设置iOS的Settings(设置)，我们不应该直接在这里创建文件，而是需要通过NSUserDefault这个类来访问应用程序的偏好设置。iTunes会自动备份该文件目录下的内容。
 
 tmp：临时文件目录，在程序重新运行的时候，和开机的时候，会清空tmp文件夹。
 
 */


//沙盒下Library/Caches文件夹路径
#define CacheFilePath  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


//沙盒下Documents文件夹路径
#define DocumentsFilePath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


//单例化一个类
// .h文件

#define LQKSingletonH + (instancetype)sharedInstance;

// .m文件
#if __has_feature(objc_arc)

#define LQKSingletonM \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else

#define LQKSingletonM \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif


//定义弱引用
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self


//定义强引用
#define StrongSelf(StrongSelf) __strong typeof(weakSelf) StrongSelf = weakSelf


// 检测block是否可用并执行
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); }


#endif /* LQKUserMacro_h */
