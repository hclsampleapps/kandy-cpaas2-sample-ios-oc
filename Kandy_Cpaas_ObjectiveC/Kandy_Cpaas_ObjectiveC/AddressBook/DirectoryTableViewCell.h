//
//  DirectoryTableViewCell.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/9/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectoryBO.h"

NS_ASSUME_NONNULL_BEGIN

@interface DirectoryTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView     *imgBg;
@property (nonatomic, weak) IBOutlet UILabel         *lblName;
@property (nonatomic, weak) IBOutlet UILabel         *lblFirstName;
@property (nonatomic, weak) IBOutlet UILabel         *lblLastName;
@property (nonatomic, weak) IBOutlet UILabel         *lblEmail;
@property (nonatomic, weak) IBOutlet UILabel         *lblUserId;
@property (nonatomic, weak) IBOutlet UILabel         *lblPhotoUrl;
@property (nonatomic, weak) IBOutlet UIImageView     *imgBuddy;

-(void)displayContentTypewith : (DirectoryBO*)object;
-(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
