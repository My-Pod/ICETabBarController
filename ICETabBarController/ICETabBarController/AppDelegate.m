//
//  AppDelegate.m
//  ICETabBarController
//
//  Created by WLY on 16/7/21.
//  Copyright © 2016年 WLY. All rights reserved.
//

#import "AppDelegate.h"
#import "ICETabbarController.h"
#import "2ViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    
    _ViewController *vc2 = [[_ViewController alloc] init];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    UIViewController *vc4 = [[UIViewController alloc] init];

    ICETabbarButtonItem *homeItem = [[ICETabbarButtonItem alloc] initWithTitle:@"首页" withSelectImage:[UIImage imageNamed:@"icon_home"] withNormalImage:[UIImage imageNamed:@"icon_home_o"]];
    ICETabbarButtonItem *meItem = [[ICETabbarButtonItem alloc] initWithTitle:@"我的" withSelectImage:[UIImage imageNamed:@"icon_user"] withNormalImage:[UIImage imageNamed:@"icon_user_o"]];
    ICETabbarButtonItem *threedItem = [[ICETabbarButtonItem alloc] initWithTitle:@"3" withSelectImage:nil withNormalImage:nil];
    ICETabbarButtonItem *fourItem = [[ICETabbarButtonItem alloc] initWithTitle:@"4" withSelectImage:nil withNormalImage:nil];
    NSArray * tabbarItems = @[homeItem,meItem, threedItem, fourItem];
    
    ICETabbarController *tabbarController = [[ICETabbarController alloc] init];
    tabbarController.tabBar.backgroundColor = [UIColor yellowColor];
    tabbarController.tabBar.tintColor = [UIColor redColor];
    tabbarController.myTabbar.myItems = tabbarItems;
    tabbarController.viewControllers = @[navi2, navi1,vc3,vc4];
    self.window.rootViewController = tabbarController;
    
//    UITabBarController *tab = [[UITabBarController alloc] init];
//    tab.viewControllers = @[navi1,navi2];
//    self.window.rootViewController = tab;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
