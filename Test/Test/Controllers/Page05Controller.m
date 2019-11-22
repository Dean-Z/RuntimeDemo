//
//  Page05Controller.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Page05Controller.h"
#import "RandomColorButton.h"

@interface Page05Controller ()

@end

@implementation Page05Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RandomColorButton *btn = [RandomColorButton new];
    btn.backgroundColor = [UIColor colorWithRed:RamdonColor green:RamdonColor blue:RamdonColor alpha:RamdonColor];
    [btn setTitle:@"点击变背景色" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickBtn {
    NSLog(@"点击了");
}

@end
