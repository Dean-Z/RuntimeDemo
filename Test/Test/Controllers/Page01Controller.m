//
//  Page01Controller.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Page01Controller.h"
#import "Person.h"

@interface Page01Controller ()

@end

@implementation Page01Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [Person new];
    p.name = @"Tom";
    p.age = 18;
    p.address = @"UA";

    NSLog(@"修改前: %@",[p description]);
    
    unsigned int count = 0;
    // 获取person里的所有属性 包括私有属性
    Ivar *ivar = class_copyIvarList([p class], &count);
    NSLog(@"打印出Person里所有属性（包括私有属性）：");
    for (int i=0; i<count; i++) {
        Ivar tmpIvar = ivar[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(tmpIvar)];
        NSLog(@"%@",ivarName);
        
        if ([ivarName isEqualToString:@"_address"]) {
            object_setIvar(p, tmpIvar, @"CN");
        }
    }
    NSLog(@"修改后：%@",[p description]);
}

@end
