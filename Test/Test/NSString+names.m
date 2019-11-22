//
//  NSString+names.m
//  Test
//
//  Created by Jason on 2019/11/21.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "NSString+names.h"
#import <objc/runtime.h>

static void *nameKey = &nameKey;

@implementation NSString (names)

- (NSString *)name {
    return objc_getAssociatedObject(self, &nameKey);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY);
}

@end
