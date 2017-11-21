//
//  LQKNavigationController.m
//  MyFramework
//
//  Created by liquan on 2017/10/18.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "LQKNavigationController.h"

@interface LQKNavigationController ()

@end

@implementation LQKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
}


//是否能够旋转（手动控制，或者自动旋转都要Return YES）
- (BOOL)shouldAutorotate {
    
    return [self.topViewController shouldAutorotate];
}


//返回你的屏幕支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}


 //viewController初始显示的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}



- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
