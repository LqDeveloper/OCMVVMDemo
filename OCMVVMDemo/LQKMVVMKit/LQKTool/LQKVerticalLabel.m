//
//  LQKVerticalLabel.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/21.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "LQKVerticalLabel.h"

@implementation LQKVerticalLabel

-(instancetype)initWithFrame:(CGRect)frame andVerticalAlignment:(LQKVerticalAlignment)vertcalAlignment{
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = vertcalAlignment;
    }
    return self;
}
-(instancetype)initWithVerticalAlignment:(LQKVerticalAlignment)vertcalAlignment{
    if (self = [super init]) {
        self.verticalAlignment = vertcalAlignment;
    }
    return self;
}




-(void)setVerticalAlignment:(LQKVerticalAlignment)verticalAlignment{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    switch (self.verticalAlignment) {
        case LQKVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
            
        case LQKVerticalAlignmentMiddle:
           textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height);
            break;
            
        case LQKVerticalAlignmentBottom:
             textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
            
        default:
             textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;

    }
    
    return textRect;
}

-(void)drawTextInRect:(CGRect)rect{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end
