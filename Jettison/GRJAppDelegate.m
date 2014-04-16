//
//  GRJAppDelegate.m
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

#pragma mark GRJAppDelegate

@implementation GRJAppDelegate

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor whiteColor]];
    [self setWindow:window];
    
    [[self window] makeKeyAndVisible];
    
    return YES;
}

@end
