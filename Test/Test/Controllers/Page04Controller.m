//
//  Page04Controller.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Page04Controller.h"
#import "Person.h"

@interface Page04Controller ()

@end

@implementation Page04Controller

#pragma GCC diagnostic ignored "-Wundeclared-selector"
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [Person new];
    
    NSLog(@"--------------------------- 实例方法互换");
    NSLog(@"互换前：");
    NSLog(@"personMethod打印：");
    objc_msgSend(p, @selector(personMethod));
    NSLog(@"fetchNameMethod打印：");
    objc_msgSend(p, @selector(fetchNameMethod));

    NSLog(@"---------------------------");
    Method method1 = class_getInstanceMethod(p.class, @selector(personMethod));
    Method method2 = class_getInstanceMethod(p.class, @selector(fetchNameMethod));
    method_exchangeImplementations(method1, method2);

    NSLog(@"互换后：");
    NSLog(@"personMethod打印：");
    objc_msgSend(p, @selector(personMethod));
    NSLog(@"fetchNameMethod打印：");
    objc_msgSend([Person new], @selector(fetchNameMethod));

    NSLog(@"--------------------------- 类方法互换");
    NSLog(@"niceShot :%@",objc_msgSend([Person class], @selector(niceShot)));
    NSLog(@"badShot :%@",objc_msgSend([Person class], @selector(badShot)));
    NSLog(@"---------------------------");
    Method method3 = class_getClassMethod([Person class], @selector(niceShot));
    Method method4 = class_getClassMethod([Person class], @selector(badShot));
    method_exchangeImplementations(method3, method4);
    NSLog(@"niceShot :%@",objc_msgSend([Person class], @selector(niceShot)));
    NSLog(@"badShot :%@",objc_msgSend([Person class], @selector(badShot)));

    NSLog(@"--------------------------- 和其他类方法互换");
    NSLog(@"niceShot :%@",objc_msgSend([Person class], @selector(niceShot)));
    NSLog(@"otherShot :%@",objc_msgSend([self class], @selector(otherShot)));
    NSLog(@"---------------------------");
    Method method5 = class_getClassMethod([self class], @selector(otherShot));
    method_exchangeImplementations(method3, method5);
    NSLog(@"niceShot :%@",objc_msgSend([Person class], @selector(niceShot)));
    NSLog(@"otherShot :%@",objc_msgSend([self class], @selector(otherShot)));
}

+ (NSString *)otherShot {
    return @"otherShot";
}

@end
