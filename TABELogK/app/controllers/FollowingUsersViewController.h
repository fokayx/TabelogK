//
//  FollowingUsersViewController.h
//  TABELogK
//
//  Created by oKay on 8/30/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DrawLine;
@interface FollowingUsersViewController : UITableViewController
{
    DrawLine *redUnderLine;
}
@property (weak, nonatomic) IBOutlet UIView *wishOrWent;

@end
