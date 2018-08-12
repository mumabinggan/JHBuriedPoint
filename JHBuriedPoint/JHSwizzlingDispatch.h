//
//  JHSwizzlingDispatch.h
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JHSwizzlingDispatch : NSObject

+ (void)handleView:(UIView *)view action:(SEL)action to:(id)target forEvent:(UIEvent *)event;

@end
