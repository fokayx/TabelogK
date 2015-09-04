//
//  UserModel.h
//  TABELogK
//
//  Created by oKay on 9/3/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserModelDelegate<NSObject>

@optional
- (void) didSignInUser;
- (void) failToSignInUserWithError:(NSError *) error;

@end

@interface UserModel : NSObject
@property (nonatomic, weak) id<UserModelDelegate> delegate;

- (void) signInWithEmail:(NSString *) email andPassword:(NSString *) password;
- (void) signInWithEmail:(NSString *) email
             andPassword:(NSString *) password
                 success:(void (^)(void))success
                    fail:(void (^)(void)) fail;
@end
