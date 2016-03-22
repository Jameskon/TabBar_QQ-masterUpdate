//
//  AppDelegate.m
//  TabBar实例_QQ
//
//  Created by kai on 16/3/9.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "ContractViewController.h"
#import "MessageViewController.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (NSString *)networkStatusWith:(NetworkStatus)status
{
    //    NotReachable = 0,  无网络连接
    //    ReachableViaWiFi,  网络可用 wifi连接
    //    ReachableViaWWAN   网络可用 2G/3G/4G数据连接
    switch(status)
    {
        case 0:
        {
            return @"NotReachable = 0,  无网络连接";
        }
            break;
        case 1:
        {
            return @"ReachableViaWiFi,  网络可用 wifi连接";
        }
            break ;
        case 2:
        {
            return @"ReachableViaWWAN   网络可用 2G/3G/4G数据连接";
        }
            break ;
            
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 实例化Reachability
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    // 获取当前网络状态
    NetworkStatus currentNetworkStatus = [reach currentReachabilityStatus];
    
    UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"判断网络状态" message:[self networkStatusWith:currentNetworkStatus] delegate:self cancelButtonTitle:@"朕知道了" otherButtonTitles:nil, nil];
    [alter show];
    
    // 初始化Window
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    
    // 初始化TabBarController
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    NewsViewController *newsVC = [[NewsViewController alloc]init];
    ContractViewController *contractVC = [[ContractViewController alloc]init];
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    
    // 将TabBarController设置为主控制器
    self.window.rootViewController = tab;
    
    
    // 设置tabBarItem
//    messageVC.tabBarItem.title = @"消息";
    messageVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"tabbar_mainframe"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    contractVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"联系人" image:[UIImage imageNamed:@"tabbar_contacts"] selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    newsVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"动态" image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    
    // 设置tabBarItem背景色
    tab.tabBar.tintColor = [UIColor colorWithRed:82/255.f green:187/255.f blue:251/255.f alpha:1.0];
    
    // 设置消息提示数
    messageVC.tabBarItem.badgeValue = @"99+";
    
    newsVC.tabBarItem.badgeValue = @"1";
    
    
    // 设置各视图控制器的navigation
    UINavigationController *a = [[UINavigationController alloc]initWithRootViewController:messageVC];
    UINavigationController *b = [[UINavigationController alloc]initWithRootViewController:contractVC];
    UINavigationController *c = [[UINavigationController alloc]initWithRootViewController:newsVC];
    
    // 把试图控制器添加进TabBarController中
    // 1. addchildrenController
//    [tab addChildViewController:messageVC];
//    [tab addChildViewController:contractVC];
//    [tab addChildViewController:newsVC];
    
    
    // 2. 快速添加TabBarController
    tab.viewControllers = @[a,b,c];
    
    // 设置message视图控制器
    
//    a.navigationItem.titleView = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"消息",@"电话", nil]];

    
    // Override point for customization after application launch.
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
