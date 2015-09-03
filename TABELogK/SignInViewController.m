//
//  SignInViewController.m
//  TABELogK
//
//  Created by oKay on 8/29/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "SignInViewController.h"
#import "DrawLine.h"
#import "AFNetworking.h"
#import "NetworkingManager.h"
#import "tabelogToken.h"
#import "SSKeychain.h"
@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.signInTabelog.layer.borderWidth = 1;
    self.signInTabelog.layer.cornerRadius = 2;
    self.signInTabelog.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.txtUsername.layer.borderWidth = 1;
    self.txtUsername.layer.cornerRadius = 4;
    self.txtUsername.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.txtPassword.layer.borderWidth = 1;
    self.txtPassword.layer.cornerRadius = 4;
    self.txtPassword.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.signInButton.layer.borderWidth = 1.3;
    self.signInButton.layer.borderColor = [UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:1.0].CGColor;
    
    orSignInWithLeft = [[DrawLine alloc] initWithFrame:CGRectMake(0, 10, 60, 2)];
    [self.orSignInWith addSubview:orSignInWithLeft];
    orSignInWithRight = [[DrawLine alloc] initWithFrame:CGRectMake(220, 10, 60, 2)];
    [self.orSignInWith addSubview:orSignInWithRight];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}



- (IBAction)signinClicked:(id)sender {

    NSString *username = [self.txtUsername text];
    NSString *password = [self.txtPassword text];
    
    
//    使用SSKeychain套件，存放Tabelog SECRET
//    NSString *secret = [SSKeychain passwordForService:@"tabelogSignIn" account:@"signInToken"];
//    NSDictionary *parameters = @{@"email":username , @"password":password, @"secret": secret};
   
    NSDictionary *parameters = @{@"email":username , @"password":password, @"secret": [TabelogToken signInSecret]};

    
    [[NetworkingManager authorizedManager] POST:@"https://ssl.tabelog-us-stg1.5xruby.tw/api/v3/authentication.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
}

-(void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

// 設定tap gesture recognizer，當點擊別處時收鍵盤
- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}


// 設定textFieldDelegate，按下return時收鍵盤
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
