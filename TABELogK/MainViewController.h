//
//  MainViewController.h
//  TABELogK
//
//  Created by oKay on 8/29/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkingManager.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *borderLabel;

@property (weak, nonatomic) IBOutlet UIButton *signUpWithFB;
@property (weak, nonatomic) IBOutlet UIButton *signUpWithIG;

@end

