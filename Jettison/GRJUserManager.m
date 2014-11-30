//
//  GRJUserManager.m
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

#import "GRJUserManager.h"

#pragma mark GRJUserManager

@implementation GRJUserManager

+ (BOOL)isAuthenticated {
    return ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]);
}

+ (void)updateCurrentUserWithFacebook:(void (^)(NSError *))completion {
    if (![self isAuthenticated]) {
        if (completion) {
            NSError *error = [NSError errorWithDomain:[[NSBundle mainBundle] bundleIdentifier] code:403 userInfo:@{ @"localizedDescription" : @"user is not authenticated" }];
            completion(error);
        }
        
        return;
    }
    
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userData = (NSDictionary *)result;
            
            PFUser *user = [PFUser currentUser];
            
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
        
        if (completion) {
            completion(error);
        }
    }];
}

@end
