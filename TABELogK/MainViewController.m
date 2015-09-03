//
//  MainViewController.m
//  TABELogK
//
//  Created by oKay on 8/29/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetWorking.h"
#import "NetworkingManager.h"
#import "TabelogToken.h"
#import "SSKeychain.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // LET'S TAKE YOU WALKTHROUGH label border
    self.borderLabel.layer.borderWidth = 1;
    self.borderLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    UIColor *buttonColor = [UIColor colorWithRed:0.84 green:0.22 blue:0.15 alpha:1.0];
    
    // Sign Up With Facebook button
    UIImage *iconFB = [[UIImage imageNamed:@"ico_facebook"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.signUpWithFB setImage:iconFB forState:UIControlStateNormal];
    
    self.signUpWithFB.layer.borderWidth = 1;
    self.signUpWithFB.layer.cornerRadius = 2;
    self.signUpWithFB.layer.borderColor = buttonColor.CGColor;
    self.signUpWithFB.layer.backgroundColor = buttonColor.CGColor;
    
    // Sign Up With Instagram button
    UIImage *iconIG = [UIImage imageNamed:@"ico_instagram"];
    [self.signUpWithIG setImage:iconIG forState:UIControlStateNormal];
    
    self.signUpWithIG.layer.borderWidth = 1;
    self.signUpWithIG.layer.borderColor = buttonColor.CGColor;
    self.signUpWithIG.layer.cornerRadius = 2;
    self.signUpWithIG.layer.backgroundColor = buttonColor.CGColor;
    
    // 向initWithBaseURL請求，取得TABELog secret，把生出AFNetworking manager和登入Tabelog的帳密，放到NetworkingManager去
  
    NSDictionary *parameters = @{@"client_type" : @"1"};
    [[NetworkingManager authorizedManager] POST:@"https://ssl.tabelog-us-stg1.5xruby.tw/api/v3/client/register.json"
                                     parameters:parameters
                                        success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
//        使用SSKeychain套件，存放Tabelog SECRET
//        [SSKeychain setPassword:[NSString stringWithFormat:@"%@",responseObject[@"secret"]] forService:@"tabelogSignIn" account:@"signInToken"];
        
        [TabelogToken setToken:responseObject[@"secret"]]; // 將manager取得的responseObject，傳給TabelogToken，用UserDefault
        
        NSLog(@"Tabelog secret: %@",[TabelogToken signInSecret]); //[TabelogToken signInSecret] 取得存在NSUserdefaults的值
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
