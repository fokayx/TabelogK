//
//  UserData.h
//  TABELogK
//
//  Created by oKay on 9/3/15.
//  Copyright (c) 2015 fokayx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserData : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * isSignedIn;

@end
