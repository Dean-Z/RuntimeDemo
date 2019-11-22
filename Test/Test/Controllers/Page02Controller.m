//
//  Page02Controller.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Page02Controller.h"
#import "NSString+names.h"

@interface Page02Controller ()

@end

@implementation Page02Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *tmpString = @"";
    tmpString.name = self.title;
    NSLog(@"%@",tmpString.name);
}

@end
