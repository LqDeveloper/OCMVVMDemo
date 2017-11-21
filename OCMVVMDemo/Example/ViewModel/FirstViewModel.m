//
//  FirstViewModel.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "FirstViewModel.h"
#import "SecondViewController.h"
@implementation FirstViewModel
-(void)lqk_getDataWithModel:(void (^)(id))modleBack{
    if (modleBack) {
        modleBack(@{@"info":@"获取数据啦啦啦"});
    }
}
-(NSURLSessionTask *)lqK_viewLoadDataWithResponse:(LQKRequestBlock)responseBlock{
    if (responseBlock) {
        responseBlock(@{@"info":@"请求数据有回调啦"},nil);
    }
    return nil;
}

-(void)lqk_viewInViewController:(UIViewController *)viewController andEvent:(NSDictionary *)info{
    if ([info[@"info"] isEqualToString:@"push"]) {
        SecondViewController *sec = [[SecondViewController alloc]init];
        [viewController.navigationController pushViewController:sec animated:YES];
    }
}

-(void)lqk_handleView:(__kindof UIView *)view andEvent:(NSDictionary *)events{
    NSLog(@"点击了View");
}

@end
