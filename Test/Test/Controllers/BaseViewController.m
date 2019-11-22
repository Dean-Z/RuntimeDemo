//
//  BaseViewController.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.text = @"结果打印在控制台";
    
    
}


@end
