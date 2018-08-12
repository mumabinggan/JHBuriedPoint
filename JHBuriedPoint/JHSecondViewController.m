//
//  JHSecondViewController.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "JHSecondViewController.h"
#import "UIView+JHBuriedPoint.h"

@interface JHSecondViewController ()

@end

@implementation JHSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Second";
    [self initSubView];
}

- (void)initSubView {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)touchBtn:(UIButton *)btn {
//    NSLog(@"%@", [btn superPath]);
    //    [btn responderPath];
    NSLog(@"%@", [btn responderPath]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
