//
//  NetworkingManager.m
//  TABELogK
//
//  Created by oKay on 9/2/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "NetworkingManager.h"
#import "AFNetworking.h"

@implementation NetworkingManager

+(void)authorizationInfo:(AFHTTPRequestOperationManager *)manager{
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"tabelog"password:@"12345678"];
}

@end
