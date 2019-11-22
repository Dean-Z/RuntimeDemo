//
//  Person.m
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong) NSString *title;

@end

@implementation Person

- (instancetype)init {
    self = [super init];
    self.title = @"JOBS";
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ \t age:%ld \t address:%@\t",self.name,self.age
            ,self.address];
}


- (void)personMethod {
    NSLog(@"personMethod");
}

- (void)fetchNameMethod {
    NSLog(@"fetchNameMethod");
}

+ (NSString *)niceShot {
    return @"niceShot";
}

+ (NSString *)badShot {
    return @"badShot";
}

@end
