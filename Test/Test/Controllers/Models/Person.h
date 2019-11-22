//
//  Person.h
//  Test
//
//  Created by Jason on 2019/11/22.
//  Copyright © 2019 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *father;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *address;

- (void)personMethod;

+ (NSString *)niceShot;

@end

