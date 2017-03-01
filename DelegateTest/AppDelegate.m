//
//  AppDelegate.m
//  DelegateTest
//
//  Created by greenlaw on 2017/2/28.
//  Copyright © 2017年 Greenlaw. All rights reserved.


//  体会kvo和普通修改方式的区别、优缺点

#import "AppDelegate.h"
#import "NumberKVOViewController.h"
#import "NumberDirectViewController.h"

@interface AppDelegate ()

@property (strong,nonatomic) NumberKVOViewController *numberKVOViewController;
@property (strong,nonatomic) NumberDirectViewController *numberDirectViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];;
    
    //KVO模式
    self.window.rootViewController = self.numberKVOViewController;
    //直接修改
//    self.window.rootViewController = self.numberDirectViewController;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -- getters and setters
- (NumberKVOViewController *)numberKVOViewController {
    
    if(_numberKVOViewController == nil) {
        _numberKVOViewController = [[NumberKVOViewController alloc]init];
    }
    return _numberKVOViewController;
}

- (NumberDirectViewController *)numberDirectViewController {
    if(_numberDirectViewController == nil) {
        _numberDirectViewController = [[NumberDirectViewController alloc]init];
    }
    return _numberDirectViewController;
}
@end
