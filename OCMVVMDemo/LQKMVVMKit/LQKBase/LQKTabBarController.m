//
//  LQKTabBarController.m
//  MyFramework
//
//  Created by liquan on 2017/10/18.
//  Copyright © 2017年 Quan Li. All rights reserved.
//

#import "LQKTabBarController.h"

@interface LQKTabBarController ()

@end

@implementation LQKTabBarController

-(instancetype)initWithControllers:(NSArray *)controllerArr andTitleArr:(NSArray *)titleArr andNormalImageArr:(NSArray *)normalImageArr andSelectImageArr:(NSArray *)selectImageArr andFont:(UIFont *)font andNormalTitleColor:(UIColor *)normalColor andSelectColor:(UIColor *)selectColor{
    if (self = [super init]) {
        self.viewControllers = controllerArr;
        for (NSInteger i = 0;i < controllerArr.count ; i++) {
            UIViewController *controller =  controllerArr[i];
            [self setTabBarItem:controller.tabBarItem title:titleArr[i] titleFontName:[UIFont systemFontOfSize:16] selectedImage:selectImageArr[i] selectedTitleColor:selectColor normalImage:normalImageArr[i] normalTitleColor:normalColor];
        }
    }
    return self;
}
- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
        titleFontName:(UIFont *)font
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor
{
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:font} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:font} forState:UIControlStateSelected];
}

-(void)lqk_removerBlackLine{
    /// 隐藏底部 TabBar 的上横线
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *ima = (UIImageView *)view;
            ima.hidden = YES;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

/**
 是否允许旋转
 
 */

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

/**
 viewController初始显示的方向
 */

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}


/**
 允许旋转的方向
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
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
