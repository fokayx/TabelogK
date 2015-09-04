//
//  TabelogUIView.m
//  TABELogK
//
//  Created by oKay on 9/3/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "TabelogUIView.h"

@implementation TabelogUIView

+(UITextField *)signInTextField:(UITextField *)textField{
    
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor whiteColor].CGColor;
    textField.layer.cornerRadius = 4;
    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 125)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    return textField;
    
}

+(UIButton *)mainSocialButton:(UIButton *)socialButton image:(UIImage *)image{
    [socialButton setImage:image forState:UIControlStateNormal];
    UIColor *buttonColor = [UIColor colorWithRed:0.84 green:0.22 blue:0.15 alpha:1.0];
    socialButton.layer.borderWidth = 1;
    socialButton.layer.borderColor = buttonColor.CGColor;
    socialButton.layer.cornerRadius = 2;
    socialButton.layer.backgroundColor = buttonColor.CGColor;
    
    return  socialButton;
}

+(UIButton *)customUIButton:(UIButton *)button borderWidth:(int)width borderColor:(UIColor *)color boderradius:(int)radius{
    button.layer.borderWidth = width;
    button.layer.borderColor = color.CGColor;
    button.layer.cornerRadius = radius;
    
    return button;
}
@end
