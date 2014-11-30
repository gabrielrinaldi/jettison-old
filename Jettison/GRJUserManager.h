//
//  GRJUserManager.h
//  Jettison
//
//  Created by Gabriel Rinaldi on 4/16/14.
//  Copyright (c) 2014 Gabriel Rinaldi. All rights reserved.
//

#pragma mark GRJUserManager

@interface GRJUserManager : NSObject

+ (BOOL)isAuthenticated;
+ (void)updateCurrentUserWithFacebook:(void (^)(NSError *error))completion;

@end
