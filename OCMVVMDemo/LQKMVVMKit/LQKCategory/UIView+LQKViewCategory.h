//
//  UIView+LQKViewCategory.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/17.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LQKViewModelProtocol.h"



@interface UIView (LQKViewCategory)


/**
 绑定ViewModel
 */
@property(nonatomic,weak)id<LQKViewModelProtocol>viewDelegate;


/**
 ViewModel返回的回调
 */
@property(nonatomic,copy)LQKViewModelBlock viewBlock;


/**
 绑定ViewModel

 @param viewModel ViewModel
 */
-(void)lqk_bindWithViewModel:(id<LQKViewModelProtocol>)viewModel;


@end
