//
//  AppDelegate.m
//  pipframes
//
//  Created by OUTTHINKING PVT LTD on 4/5/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "AppDelegate.h"
#import "DEMONavigationController.h"
#import "DEMOMenuViewController.h"
#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window= _window;

@synthesize viewController = _viewController;


- (BOOL)schemeAvailable:(NSString *)scheme
{
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];
    return [application canOpenURL:URL];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[ViewController alloc] init];
    
    self.viewController.isSelectionOptionEnable = true;
    
    DEMOMenuViewController *menuController = [[DEMOMenuViewController alloc] initWithStyle:UITableViewStylePlain];
    
    DEMONavigationController *navigationController = [[DEMONavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:menuController];
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    frostedViewController.liveBlur = NO;
    frostedViewController.delegate = self;
    frostedViewController.blurRadius = 5;
    frostedViewController.blurTintColor = [UIColor colorWithWhite:0.7 alpha:0.8];
    frostedViewController.backgroundFadeAmount = 0.3;
    
    self.window.rootViewController = frostedViewController;
    
    self.window.backgroundColor = [UIColor clearColor];
    
    [application setStatusBarHidden:YES];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application  openURL:(NSURL *)url  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [[FBSDKApplicationDelegate sharedInstance] application:application                                                          openURL:url  sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    [self.window setFrame:bounds];
    [self.window setBounds:bounds];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
     NSLog(@"applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBSDKAppEvents activateApp];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
