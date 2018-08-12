//
//  UIViewController+JHBuriedPoint.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "UIViewController+JHBuriedPoint.h"
#import <objc/runtime.h>

@implementation UIViewController (JHBuriedPoint)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL fromSEL = @selector(viewWillAppear:);
        SEL toSEL = @selector(swizzling_viewWillAppear:);
        Method fromMethod = class_getInstanceMethod([self class], fromSEL);
        Method toMethod = class_getInstanceMethod([self class], toSEL);
        BOOL addMethod = class_addMethod([self class], fromSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod));
        if (addMethod) {
            class_replaceMethod([self class], toSEL, method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod));
        }
        else {
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });
}

- (void)swizzling_viewWillAppear:(BOOL)animated {
    [self swizzling_viewWillAppear:animated];
//    NSLog(@"======swizzling_viewWillAppear:%@======", [self class]);
}

@end
