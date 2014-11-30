//
//  GRJLoginViewController.m
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

#import "GRJUserManager.h"
#import "GRJLoginViewController.h"

#pragma mark GRJLoginViewController (Private)

@interface GRJLoginViewController ()

@end

#pragma mark - GRJLoginViewController

@implementation GRJLoginViewController

#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

#pragma mark - Button actions

- (IBAction)loginHandler:(UIButton *)loginButton {
    NSArray *permissionsArray = @[ @"user_about_me" ];
    
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if ([user isNew]) {
            NSLog(@"User with facebook signed up and logged in!");
            
            [GRJUserManager updateCurrentUserWithFacebook:^(NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        } else {
            NSLog(@"User with facebook logged in!");
            
            [GRJUserManager updateCurrentUserWithFacebook:^(NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        }
    }];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [GRJUserManager updateCurrentUserWithFacebook:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
