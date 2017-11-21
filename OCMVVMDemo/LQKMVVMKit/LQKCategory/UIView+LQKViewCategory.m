//
//  UIView+LQKViewCategory.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/17.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "UIView+LQKViewCategory.h"
#import <objc/runtime.h>


@implementation UIView (LQKViewCategory)


-(void)setViewDelegate:(id<LQKViewModelProtocol>)viewDelegate{
     objc_setAssociatedObject(self, @selector(viewDelegate),viewDelegate, OBJC_ASSOCIATION_ASSIGN);
}


-(id<LQKViewModelProtocol>)viewDelegate{
     return objc_getAssociatedObject(self, _cmd);
}


-(LQKViewModelBlock)viewBlock{
    return objc_getAssociatedObject(self, _cmd);
}


-(void)setViewBlock:(LQKViewModelBlock)viewBlock{
    objc_setAssociatedObject(self, @selector(viewBlock), viewBlock, OBJC_ASSOCIATION_COPY);
}


-(void)lqk_bindWithViewModel:(id<LQKViewModelProtocol>)viewModel{
    if (!self.viewDelegate) {
        self.viewDelegate = viewModel;
    }
}

@end
