//
//  UIView+JHBuriedPoint.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "UIView+JHBuriedPoint.h"

@implementation UIView (JHBuriedPoint)

- (NSString *)responderPath {
    NSMutableString *path = [NSMutableString string];
    [self insertFromBeginToPath:path view:self];
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            [self insertFromBeginToPath:path string:NSStringFromClass([responder class])];
            break;
        }
        else if ([responder isKindOfClass:[UIView class]]) {
            [self insertFromBeginToPath:path view:(UIView *)responder];
        }
        responder = responder.nextResponder;
    }
    return path;
}

- (void)insertFromBeginToPath:(NSMutableString *)path view:(UIView *)view {
    NSString *insertStr = [NSString stringWithFormat:@"_%@(%ld)", NSStringFromClass([view class]), [self indexOfBrotherView:view]];
    [self insertFromBeginToPath:path string:insertStr];
}

- (void)insertFromBeginToPath:(NSMutableString *)path string:(NSString *)string {
    [path insertString:string atIndex:0];
}

- (NSInteger)indexOfBrotherView:(UIView *)view {
    NSMutableArray *mArray = [NSMutableArray array];
    for (UIView *item in view.superview.subviews) {
        if ([item isKindOfClass:[view class]]) {
            [mArray addObject:item];
        }
    }
    return [mArray indexOfObject:view];
}

@end
