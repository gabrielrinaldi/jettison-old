//
//  GRJLoginViewController.m
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

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
        } else {
            NSLog(@"User with facebook logged in!");
        }
    }];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        FBRequest *request = [FBRequest requestForMe];
        [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                NSDictionary *userData = (NSDictionary *)result;
                
                NSString *facebookID = userData[@"id"];
                NSString *name = userData[@"name"];
                NSString *location = userData[@"location"][@"name"];
                NSString *gender = userData[@"gender"];
                NSString *birthday = userData[@"birthday"];
                NSString *relationship = userData[@"relationship_status"];
                
                NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                
                NSLog(@"User with facebook data: %@", userData);
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        }];
    }
}

@end
