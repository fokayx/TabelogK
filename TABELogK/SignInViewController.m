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
#import "TabelogUIView.h"
#import "UserModel.h"
@interface SignInViewController ()<UserModelDelegate>

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.signInTabelog.layer.borderWidth = 1;
    self.signInTabelog.layer.cornerRadius = 2;
    self.signInTabelog.layer.borderColor = [UIColor whiteColor].CGColor;
    
 
    [TabelogUIView signInTextField:self.txtUsername];
    [TabelogUIView signInTextField:self.txtPassword];
    
    [TabelogUIView customUIButton:self.signInButton
                    borderWidth:1.3
                    borderColor:[UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:1.0]
                    boderradius:0
     ];
    
    orSignInWithLeft = [[DrawLine alloc] initWithFrame:CGRectMake(0, 10, 60, 2)];
    [self.orSignInWith addSubview:orSignInWithLeft];
    
    orSignInWithRight = [[DrawLine alloc] initWithFrame:CGRectMake(220, 10, 60, 2)];
    [self.orSignInWith addSubview:orSignInWithRight];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

// delegate method
- (void)didSignInUser
{
    NSLog(@"yy");
}

- (void)failToSignInUserWithError:(NSError *)error
{
    NSLog(@"e = %@", error);
}

- (IBAction)signinClicked:(id)sender {
    NSString *username = [self.txtUsername text];
    NSString *password = [self.txtPassword text];
    
    UserModel* user = [[UserModel alloc] init];
    
//    block寫法，再研究，先使用delegate寫法
//    [user signInWithEmail:username
//              andPassword:password
//                  success:^{NSLog(@"uu");}
//                     fail:^{NSLog(@"ff");}];
    
    user.delegate = self;
    [user signInWithEmail:username andPassword:password];
}

-(void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil
                              ];
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
