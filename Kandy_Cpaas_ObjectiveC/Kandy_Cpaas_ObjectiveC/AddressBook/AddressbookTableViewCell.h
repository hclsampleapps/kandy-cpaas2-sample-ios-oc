//
//  AddressbookTableViewCell.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/10/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectoryBO.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressbookTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView         *imgBg;
@property (nonatomic, weak) IBOutlet UITextField         *txtContactId;
@property (nonatomic, weak) IBOutlet UITextField         *txtPrimaryContact;
@property (nonatomic, weak) IBOutlet UITextField         *txtFirstName;
@property (nonatomic, weak) IBOutlet UITextField         *txtLastName;
@property (nonatomic, weak) IBOutlet UITextField         *txtEmail;
@property (nonatomic, weak) IBOutlet UITextField         *txtBusinessPhoneNumber;
@property (nonatomic, weak) IBOutlet UITextField         *txtHomePhoneNumber;
@property (nonatomic, weak) IBOutlet UIImageView         *imgBuddy;
@property (nonatomic, weak) IBOutlet UIButton            *btnBuddy;


-(void)displayContentTypewith : (AddressbookBO*)object;
-(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
