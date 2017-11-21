//
//  FirstView.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "FirstView.h"
#import "LQKVerticalLabel.h"
@interface FirstView()
@property(nonatomic)UIButton *button;
@property(nonatomic)LQKVerticalLabel *lable;
@end

@implementation FirstView

-(instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.button];
        [self addSubview:self.lable];
    }
    return self;
}

-(UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, 60, 20);
        [_button setTitle:@"点击" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

-(LQKVerticalLabel *)lable{
    if (!_lable) {
        _lable = [[LQKVerticalLabel alloc]initWithFrame:CGRectMake(20, 50, 80, 80)];
        _lable.verticalAlignment = LQKVerticalAlignmentBottom;
        _lable.backgroundColor = [UIColor greenColor];
        _lable.textColor = [UIColor yellowColor];
        _lable.text = @"这是lable";
    }
    return _lable;
}

-(void)clickButton{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(lqk_handleViewCallbackBlock:)]) {
       
    }
}


@end
