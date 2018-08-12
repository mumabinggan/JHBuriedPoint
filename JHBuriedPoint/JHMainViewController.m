//
//  JHMainViewController.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "JHMainViewController.h"
#import "JHFirstViewController.h"
#import "JHSecondViewController.h"

@interface JHMainViewController ()

@end

@implementation JHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JHFirstViewController *fVC = [JHFirstViewController new];
    UINavigationController *fNav = [[UINavigationController alloc] initWithRootViewController:fVC];
    
    JHSecondViewController *sVC = [JHSecondViewController new];
    UINavigationController *sNav = [[UINavigationController alloc] initWithRootViewController:sVC];
    
    self.viewControllers = @[fNav, sNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
