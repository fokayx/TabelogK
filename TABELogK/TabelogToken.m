//
//  TabelogToken.m
//  TABELogK
//
//  Created by oKay on 9/2/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "TabelogToken.h"

@implementation TabelogToken

+(void)getToken:(NSDictionary *)responseObject {
    NSUserDefaults *tabelogSecret = [NSUserDefaults standardUserDefaults];
    [tabelogSecret setObject:responseObject[@"secret"] forKey:@"secret"];
    //[tabelogSecret synchronize]; 意指立刻存入，可以不寫
}

+(NSString *)signInSecret{
    NSUserDefaults *tabelogSecret = [NSUserDefaults standardUserDefaults];
    NSString *getTabelogSecert = [tabelogSecret objectForKey:@"secret"];
    return getTabelogSecert;
}

@end