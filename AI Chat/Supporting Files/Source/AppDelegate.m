//
//  AppDelegate.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "XYZChatViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    XYZChatViewController * chatVC = [[XYZChatViewController alloc]init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:chatVC];   
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    [QBSettings setAccountKey:XYZ_accountKey];
    [QBSettings setApplicationID:XYZ_appID];
    [QBSettings setAuthKey:XYZ_authKey];
    [QBSettings setAuthSecret:XYZ_authSecret];
    return YES;
}

@end
