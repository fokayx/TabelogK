//
//  UserModel.m
//  TABELogK
//
//  Created by oKay on 9/3/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "UserModel.h"
#import "TabelogToken.h"
#import "NetworkingManager.h"
#import <AFNetworking.h>
#import <CoreData+MagicalRecord.h>
#import "UserData.h"

@implementation UserModel
-(void)signInWithEmail:(NSString *)email andPassword:(NSString *)password success:(void (^)(void))success fail:(void (^)(void))fail
{
    NSDictionary* params = @{
                             @"secret": [TabelogToken signInSecret],
                             @"email": email,
                             @"password": password,
                             };
    
    [[NetworkingManager authorizedManager] POST:@"https://ssl.tabelog-us-stg1.5xruby.tw/api/v3/authentication.json"
                                     parameters:params
                                        success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        
        NSDictionary* user = responseObject[@"user"];
        
        // save data
        
        UserData* data = [UserData MR_findFirstByAttribute:@"userId" withValue:user[@"id"]];
        if (!data) {
            data = [UserData MR_createEntity];
            data.userId = (NSNumber *) user[@"id"];
        }
        data.name = user[@"name"];
        data.isSignedIn = @(YES);
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        
        
        if (success) {
            success();
        } else {
            NSLog(@"success lalala");
        }
        // 確保執行時有做success這個block，假如沒有就印"success lalala"，像這樣就是沒有success block
        //        [user signInWithEmail:username
        //                  andPassword:password
        //                      success:nil
        //                         fail:^{NSLog(@"ff");}];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (fail) {
            fail();
            NSLog(@"NOOO %@", error);
        } else {
            NSLog(@"fail");
        }
    }];
    
}
- (void)signInWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSDictionary* params = @{
                              @"secret": [TabelogToken signInSecret],
                              @"email": email,
                              @"password": password,
                            };
    
    [[NetworkingManager authorizedManager] POST:@"https://ssl.tabelog-us-stg1.5xruby.tw/api/v3/authentication.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        
        if ([self.delegate respondsToSelector:@selector(didSignInUser)]) {
            [self.delegate didSignInUser];
        } else {
            NSLog(@"sign in success (no delegation)");
        }
        //self.delegate =>我的delegate有沒有作"didSignInUser"啊，至於self.delegate現在素隨還不知道，self是呼叫這個方法的實體物件
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if ([self.delegate respondsToSelector:@selector(failToSignInUserWithError:)]) {
            [self.delegate failToSignInUserWithError:error];
        } else {
            NSLog(@"sign in fail (no delegation)");
        }
        
    }];
    
}

- (void) signInWithEmail:(NSString *) email andPassword:(NSString *) password delegate:(id)delegate
{
    NSDictionary* params = @{
                             @"secret": [TabelogToken signInSecret],
                             @"email": email,
                             @"password": password,
                             };
    
    [[NetworkingManager authorizedManager] POST:@"https://ssl.tabelog-us-stg1.5xruby.tw/api/v3/authentication.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        
        if ([delegate respondsToSelector:@selector(didSignInUser)]) {
            [delegate didSignInUser];
        } else {
            NSLog(@"sign in success (no delegation)");
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if ([delegate respondsToSelector:@selector(failToSignInUserWithError:)]) {
            [delegate failToSignInUserWithError:error];
        } else {
            NSLog(@"sign in fail (no delegation)");
        }
        
    }];
    
}


@end
