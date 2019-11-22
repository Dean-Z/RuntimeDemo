//
//  Page03Controller.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Page03Controller.h"
#import "Person.h"

@interface Page03Controller ()

@end

@implementation Page03Controller

#pragma GCC diagnostic ignored "-Wundeclared-selector"
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block NSMutableArray *methodsList = [self getAllMethods:[Person class]];
    NSLog(@"添加前打印Person获取到的所有方法  数量：%ld",methodsList.count);
    for (NSString* methodString in methodsList) {
        NSLog(@"%@",methodString);
    }
    
    /*
    动态添加 eat 方法
    (IMP)eatFoods 意思是 eatFoods 的地址指针;
    "v@:" 意思是，v 代表无返回值 void，如果是 i 则代表 int；@代表 id sel; : 代表 SEL _cmd;
    “v@:@@” 意思是，两个参数的没有返回值。
    PS: 添加一次就可以了
    */
    if (![[Person new] respondsToSelector:@selector(eat)]) {
        NSLog(@"---------------------------------------------------------");
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            class_addMethod([Person class], @selector(eat), (IMP)eatFoods, "v@:");
            methodsList = [self getAllMethods:[Person class]];
            NSLog(@"添加后打印Person获取到的所有方法  数量：%ld",methodsList.count);
            for (NSString* methodString in methodsList) {
                NSLog(@"%@",methodString);
            }
        });
    }
    
    [[Person new] performSelector:@selector(eat)];
}

- (NSMutableArray *)getAllMethods:(Class)class {
    unsigned int count = 0;
    Method *methods = class_copyMethodList(class, &count);
    NSMutableArray *tmp = @[].mutableCopy;
    for (int i=0; i<count; i++) {
        Method method = methods[i];
//        IMP imp = method_getImplementation(method);
        SEL sel = method_getName(method);
        const char *selName = sel_getName(sel);
        const char *encoding = method_getTypeEncoding(method);
        NSString *result = [NSString stringWithFormat:@"方法名：%@, 参数个数：%d, 编码方式：%@",[NSString stringWithUTF8String:selName],method_getNumberOfArguments(method),[NSString stringWithUTF8String:encoding]];
        [tmp addObject:result];
    }
    return tmp;
}

void eatFoods(id self, SEL _cmd) {
    NSLog(@"eat foods");
}

@end
