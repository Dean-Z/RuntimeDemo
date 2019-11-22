//
//  AppDelegate.m
//  Test
//
//  Created by Jason on 2019/11/21.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *splash = [ViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:splash];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
