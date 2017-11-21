//
//  FirstViewController.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/20.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstView.h"
#import "FirstViewModel.h"
@interface FirstViewController ()
@property(nonatomic)FirstView *firstView;
@property(nonatomic)FirstViewModel *viewModel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.firstView];
    self.firstView.frame = CGRectMake(50, 150, 200, 200);
    
    [self.firstView lqk_bindWithViewModel:self.viewModel];
   
}

-(FirstView *)firstView{
    if (!_firstView) {
        _firstView = [FirstView new];
        _firstView.backgroundColor = [UIColor redColor];
    }
    return _firstView;
}

-(FirstViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [FirstViewModel new];
    }
    return _viewModel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
