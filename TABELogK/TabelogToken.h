//
//  TabelogToken.h
//  TABELogK
//
//  Created by oKay on 9/2/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabelogToken : NSObject



+(void)getToken:(NSDictionary *)responseObject;
+(NSString *)signInSecret;

@end
