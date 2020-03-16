//
//  DirectoryBO.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DirectoryBO : NSObject

@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *photoUrl;
@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *lastName;
@property (nonatomic, strong) NSString  *userId;
@property (nonatomic, strong) NSString  *email;
@property (nonatomic, assign) BOOL      isBuddy;

@end

@interface AddressbookBO : NSObject

@property (nonatomic, strong) NSString  *contactId;
@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *lastName;
@property (nonatomic, strong) NSString  *primaryContact;
@property (nonatomic, strong) NSString  *email;
@property (nonatomic, strong) NSString  *homePhoneNumber;
@property (nonatomic, strong) NSString  *businessPhoneNumber;
@property (nonatomic, assign) BOOL      isBuddy;

@end
NS_ASSUME_NONNULL_END
