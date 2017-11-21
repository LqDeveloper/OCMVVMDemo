//
//  LQDRootViewController.m
//  MyFramework
//
//  Created by liquan on 2017/10/17.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "LQKRootViewController.h"


@interface LQKRootViewController ()
@property(nonatomic,assign)UIStatusBarStyle statusBarStyle;
@property(nonatomic,assign)BOOL statusBarHiden;
@property(nonatomic,assign)BOOL changeStatusBarAnimation;
@end

@implementation LQKRootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
是否允许旋转

 */
-(BOOL)shouldAutorotate{
    return NO;
}

/**
 允许旋转的方向
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

/**
 viewController初始显示的方向
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

//禁止从侧边返回
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
}

-(void)lqk_setupRotation:(UIInterfaceOrientation)orientation{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}



-(void)lqk_layoutNavigationBar:(UIImage *)backGroundImage titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont leftBarButtonItem:(UIBarButtonItem *)leftItem rightBarButtonItem:(UIBarButtonItem *)rightItem{
    if (backGroundImage) {
        [self.navigationController.navigationBar setBackgroundImage:backGroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    }
    
    if (titleColor&&titleFont) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
    }else if (titleColor){
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    }else if (titleFont){
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];
    }
    
    if (leftItem) {
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (rightItem) {
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

-(void)lqk_hideNavigationBar:(BOOL)isHide animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.navigationController.navigationBarHidden = isHide;
        }];
    }else{
        self.navigationController.navigationBarHidden =isHide;
    }
}

-(void)lqk_back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)lqk_removeNavigationBarBottomLine{
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    
    if (self.statusBarStyle != UIStatusBarStyleLightContent) {
        
        return self.statusBarStyle;
        
    } else {
        
        return UIStatusBarStyleLightContent;
    }
}

- (BOOL)prefersStatusBarHidden {
    
    return self.statusBarHiden;
    
}


-(void)lqk_changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle statusBarHidden:(BOOL)statusBarHidden changeStatusBarAnimated:(BOOL)animated{
    
    self.statusBarStyle = statusBarStyle;
    
    self.statusBarHiden = statusBarHidden;
    
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    }else{
        [self setNeedsStatusBarAppearanceUpdate];
    }
}



-(void)dealloc{
    NSLog(@"\n=============== %@ 销毁了 ============\n",[self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
