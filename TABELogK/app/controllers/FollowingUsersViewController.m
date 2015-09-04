//
//  FollowingUsersViewController.m
//  TABELogK
//
//  Created by oKay on 8/30/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import "FollowingUsersViewController.h"
#import "DrawLine.h"


@interface FollowingUsersViewController ()

@end

@implementation FollowingUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    redUnderLine = [[DrawLine alloc] initWithFrame:CGRectMake(20, 32, 120, 3)];
    [redUnderLine setBackgroundColor:[UIColor redColor]];
    [self.wishOrWent addSubview:redUnderLine];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeInfoIdentifier"];
    
    UIView *viewRadius = (UIView *)[cell viewWithTag:1000];
    viewRadius.layer.borderWidth = 0.2;
    viewRadius.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1.0].CGColor;
    viewRadius.layer.cornerRadius = 5;
    
    UIButton *buttonStore = (UIButton *)[cell viewWithTag:1001];
    UILabel *labelAddress = (UILabel *)[cell viewWithTag:1002];
    UILabel *labelStatus = (UILabel *)[cell viewWithTag:1003];
    UILabel *labelReview = (UILabel *)[cell viewWithTag:1004];
   
    
    if(indexPath.row == 0){
        [buttonStore setTitle:@"okay shop" forState:UIControlStateNormal];
        labelAddress.text = @"台北市信義區松智路1 號19 樓A號19 樓A";
        labelStatus.text = @"WishedForm";
        labelReview.text = @"MaryApple Review";
    } else if(indexPath.row ==1) {
        [buttonStore setTitle:@"Eddie Ruby" forState:UIControlStateNormal];
        labelAddress.text = @"University of Southern California Los Angeles, CA 90033";
        labelStatus.text = @"WishedForm";
        labelReview.text = @"MaryApple Review";
    }
    return cell;
    
    
}



@end
