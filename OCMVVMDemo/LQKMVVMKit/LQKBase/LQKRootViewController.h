//
//  LQKRootViewController.h
//  MyFramework
//
//  Created by liquan on 2017/10/17.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQKRootViewController: UIViewController



/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
-(void)lqk_hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated;

/**
 * 功能： 布局导航栏界面
 * 参数：（1）导航栏背景：backGroundImage
 *      （2）导航栏标题颜色：titleColor
 *      （3）导航栏标题字体：titleFont
 *      （4）导航栏左侧按钮：leftItem
 *      （5）导航栏右侧按钮：rightItem
 */
-(void)lqk_layoutNavigationBar:(UIImage*)backGroundImage
                titleColor:(UIColor*)titleColor
                 titleFont:(UIFont*)titleFont
         leftBarButtonItem:(UIBarButtonItem*)leftItem
        rightBarButtonItem:(UIBarButtonItem*)rightItem;

/**
 * 功能：设置修改StatusBar
 * 参数：（1）StatusBar样式：statusBarStyle
 *      （2）是否隐藏StatusBar：statusBarHidden
 *      （3）是否动画过渡：animated
 */

-(void)lqk_changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle
            statusBarHidden:(BOOL)statusBarHidden
    changeStatusBarAnimated:(BOOL)animated;



/**
 点击导航返回
 */
-(void)lqk_back;

/**
 移除navigationBar最下面的黑线
 */
-(void)lqk_removeNavigationBarBottomLine;

/**
 手动设置旋转

 @param orientation 旋转的方向
 */
-(void)lqk_setupRotation:(UIInterfaceOrientation) orientation;


@end
