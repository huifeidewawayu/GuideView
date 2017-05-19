//
//  AppDelegate.m
//  GuideView
//
//  Created by wurui on 17/4/5.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[GuideViewController alloc] init];
    [self.window makeKeyWindow];
    
    return YES;
}

@end
