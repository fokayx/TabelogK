//
//  TabelogUIView.h
//  TABELogK
//
//  Created by oKay on 9/3/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelogUIView : UIView
+(UITextField *)signInTextField:(UITextField *)textField;
+(UIButton *)mainSocialButton:(UIButton *)socialButton image:(UIImage *)image;
+(UIButton *)customUIButton:(UIButton *)button borderWidth:(int)width borderColor:(UIColor *)color boderradius:(int)radius;
@end
