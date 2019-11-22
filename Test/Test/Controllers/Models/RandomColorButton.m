//
//  RandomColorButton.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "RandomColorButton.h"
#import <objc/runtime.h>

@implementation RandomColorButton

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
        Method method2 = class_getInstanceMethod(self.class, @selector(randomColorWhenSendAction:to:forEvent:));
        BOOL addSucceed = class_addMethod(self.class, @selector(sendAction:to:forEvent:), method_getImplementation(method2), method_getTypeEncoding(method2));
        // 一般都会添加成功 然后直接替换 这里防止出现添加失败的情况
        if (addSucceed) {
            class_replaceMethod(self.class,  @selector(randomColorWhenSendAction:to:forEvent:), method_getImplementation(method1), method_getTypeEncoding(method1));
        } else {
            // 如果添加方法失败 则直接替换两个方法的实现
            method_exchangeImplementations(method1, method2);
        }
    });
}

- (void)randomColorWhenSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor colorWithRed:RamdonColor green:RamdonColor blue:RamdonColor alpha:1.0f];
    [self randomColorWhenSendAction:action to:target forEvent:event];
}

@end
