//
//  LQKVerticalLabel.h
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/21.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 label文字垂直方向的位置
 
 - LQKVerticalAlignmentTop: 垂直居上
 - LQKVerticalAlignmentMiddle: 垂直居中
 - LQKVerticalAlignmentBottom: 垂直居下
 */
typedef NS_ENUM(NSInteger ,LQKVerticalAlignment) {
    LQKVerticalAlignmentTop = 0,
    LQKVerticalAlignmentMiddle,
    LQKVerticalAlignmentBottom,
};


@interface LQKVerticalLabel : UILabel
@property(nonatomic,assign)LQKVerticalAlignment verticalAlignment;

/**
 创建可以调节垂直位置的lable

 @param frame frame
 @param vertcalAlignment 垂直的位置
 @return 对象
 */
-(instancetype)initWithFrame:(CGRect)frame andVerticalAlignment:(LQKVerticalAlignment)vertcalAlignment;


/**
 创建可以调节垂直位置的label

 @param vertcalAlignment 垂直位置
 @return 对象
 */
-(instancetype)initWithVerticalAlignment:(LQKVerticalAlignment)vertcalAlignment;
@end
