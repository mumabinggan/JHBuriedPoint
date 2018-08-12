//
//  UIControl+JHBuriedPoint.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "UIControl+JHBuriedPoint.h"
#import <objc/runtime.h>
#import "JHSwizzlingDispatch.h"

@implementation UIControl (JHBuriedPoint)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL fromSEL = @selector(sendAction:to:forEvent:);
        SEL toSEL = @selector(swizzling_sendAction:to:forEvent:);
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

- (void)swizzling_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self swizzling_sendAction:action to:target forEvent:event];
    [JHSwizzlingDispatch handleView:self action:action to:target forEvent:event];
//    [JHSwizzlingDispatch handleAction:action to:target forEvent:event];
}

@end
