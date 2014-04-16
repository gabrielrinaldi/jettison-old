//
//  GRJAppDelegate.m
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

#import "GRJLoginViewController.h"

#pragma mark GRJAppDelegate

@implementation GRJAppDelegate

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"OTyKC1bK82LMQtYE6hHZ5yRUquF0swUJoDgJtXzP" clientKey:@"1xbGAEBqzq6tsAcWFHyZqEynOrsKTJxKm4x4c5ng"];
    [PFFacebookUtils initializeFacebook];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor whiteColor]];
    
    GRJLoginViewController *loginViewController = [[GRJLoginViewController alloc] initWithNibName:@"GRJLoginViewController" bundle:nil];
    [window setRootViewController:loginViewController];
    
    [self setWindow:window];
    
    [[self window] makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

#pragma mark - URL handling

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:[PFFacebookUtils session]];
}

@end
