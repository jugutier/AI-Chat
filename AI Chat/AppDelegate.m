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
    [QBSettings setAccountKey:@"testtest"];
    [QBSettings setApplicationID:40416];
    [QBSettings setAuthKey:@"bZFzCGBwVxfn7dw"];
    [QBSettings setAuthSecret:@"ZyXkazq2a5W3sf8"];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
