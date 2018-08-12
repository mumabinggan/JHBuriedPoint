//
//  JHSwizzlingDispatch.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "JHSwizzlingDispatch.h"
#import <UIKit/UIKit.h>

@implementation JHSwizzlingDispatch

+ (instancetype)getInstance {
    static JHSwizzlingDispatch *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JHSwizzlingDispatch alloc] init];
    });
    return instance;
}

+ (void)handleView:(UIView *)view action:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([view isMemberOfClass:[UISwitch class]]) {
        NSLog(@"=UISwitch=");
    }
    else if ([view isMemberOfClass:[UITextField class]]) {
        NSLog(@"=UITextField=");
    }
    else {
        NSLog(@"=UIControl=");
    }
}

@end
