//
//  LQKTabBarController.h
//  MyFramework
//
//  Created by liquan on 2017/10/18.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LQKTabBarController : UITabBarController

/**
 初始化tabBarController

 @param controllerArr 视图数组
 @param titleArr 底部tabBarItem的titie数组
 @param normalImageArr 未选中图片数组
 @param selectImageArr 选中图片数组
 @param font tabBarItem的字体
 @param normalColor 未选中的字体颜色
 @param selectColor 选中时的子图颜色
 @return 初始化的对象
 */
-(instancetype)initWithControllers:(NSArray *)controllerArr andTitleArr:(NSArray*)titleArr andNormalImageArr:(NSArray *)normalImageArr andSelectImageArr:(NSArray *)selectImageArr andFont:(UIFont *)font andNormalTitleColor:(UIColor *)normalColor andSelectColor:(UIColor *)selectColor;


/**
 移除底部黑线
 */
-(void)lqk_removerBlackLine;
@end
