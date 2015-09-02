//
//  NetworkingManager.h
//  TABELogK
//
//  Created by oKay on 9/2/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface NetworkingManager : NSObject

+(void)authorizationInfo:(AFHTTPRequestOperationManager *)manager;
@end
