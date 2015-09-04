//
//  SignInViewController.h
//  TABELogK
//
//  Created by oKay on 8/29/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DrawLine;
@interface SignInViewController : UIViewController <UITextFieldDelegate>

{
    DrawLine *orSignInWithLeft;
    DrawLine *orSignInWithRight;
}

@property (weak, nonatomic) IBOutlet UIView *signInTabelog;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIView *orSignInWith;

- (IBAction)signinClicked:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
